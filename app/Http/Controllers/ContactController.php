<?php

namespace App\Http\Controllers;

use App\Models\ContactMessage;
use App\Models\MessageResponse;
use App\Models\Customer;
use App\Models\PredefinedMessage;
use App\Models\Admin;
use App\Models\Notification;
use App\Models\ServiceRequest;
use App\Events\ContactMessageEvent;
use Illuminate\Http\Request;
use App\Services\NotificationService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;

class ContactController extends Controller
{
    protected static function booted()
    {
        static::creating(function ($model) {

            // Ensure content key exists (DB requirement)
            if (empty($model->ikm_ck)) {
                $model->ikm_ck = hash(
                    'sha256',
                    ($model->yhn_cid ?? 'guest') . '|' .
                    ($model->qwe_cat ?? '') . '|' .
                    now()->timestamp
                );
            }

            // Encrypt sensitive fields
            if (method_exists($model, 'encryptSensitiveData')) {
                $model->encryptSensitiveData();
            }
        });
    }
    public function chat(Request $request)
    {
        return view('admin.chat');
    }

    public function submit(Request $request)
    {
        
        try {
            // Validate incoming request
            $validated = $request->validate([
                'name'    => 'required|string|max:255',
                'email'   => 'required|email|max:255',
                'phone'   => 'nullable|string|max:20',
                'subject' => 'required|string|max:255',
                'message' => 'required|string',
            ]);

            // Create or find customer
            $customer = Customer::updateOrCreate(
                ['klj_em' => $validated['email']],
                [
                    'iop_nm' => $validated['name'],
                    'qaz_ph' => $validated['phone'] ?? null,
                ]
            );

            \Log::info('Before saving contact message', [
                'data' => [
                    'customer_id' => $customer->k2_id,
                    'olp_ct'     => $validated['message'],
                    'qwe_cat'     => $validated['subject'],
                ]
            ]);


            $contactMessage = ContactMessage::create([
                'yhn_cid' => $customer->k2_id,
                'olp_ct'  => $validated['message'],
                'qwe_cat' => $validated['subject'],
                'ikm_ck'  => Str::uuid()->toString(), // ✅ FIX
                'status'  => ContactMessage::STATUS_NEW,
                'rty_ir'  => false,
                'jkl_lut' => now(),
            ]);

            // Log notification via service (AUDIT / MONITORING)
            NotificationService::logIncomingCustomerMessage(
                customer: $customer,
                message: $contactMessage
            );

            $subject = strtolower(trim($validated['subject']));

            try
            {
                if ($subject === 'installation') 
                {
                    ServiceRequest::create([
                        'a1_nm' => $customer->iop_nm,
                        'b2_ct' => $customer->klj_em ?? $customer->qaz_ph,
                        'c3_ad' => 'installation',   // was c3_st
                        'd4_rt' => 'website',        // was d4_sc
                        'g7_st' => 'new',
                        'h8_nt' => null,             // instead of h8_pr
                    ]);     

                    NotificationService::createC([
                        'tya_tp'  => 'info',
                        'uio_tt'  => 'New installation request',
                        'asd_msg' => 'A new installation request requires support confirmation.',
                        'zxc_at'  => 'create',
                        'plm_ut'  => 'system',
                        'fgh_ic'  => 'bx bx-info-circle',
                    ]);
                }
            } catch (\Exception $e) {
                \Log::error('Error creating installation service request', [
                    'error' => $e->getMessage(),
                    'trace' => $e->getTraceAsString(),
                ]);


            }

            return redirect('/')->with('success', 'Your message has been sent.');
        }
        catch (\Illuminate\Validation\ValidationException $e) {

            \Log::info('Contact MSG - ValidationException', [
                'error' => $e->getMessage()
            ]);

            NotificationService::logValidationError(
                'Contact message validation failed',
                $e,
                context: ['source' => 'landing_page']
            );

            return redirect('/')
                ->withErrors($e->validator)
                ->withInput();
        }
        catch (\Throwable $e) {

            \Log::info('Contact MSG - Throwable', [
                'error' => $e->getMessage(),
            ]);

            NotificationService::logSystemError(
                'Error creating contact message',
                $e,
                context: ['source' => 'landing_page']
            );

            return redirect('/')
                ->with('error', 'Something went wrong. Please try again.');
        }
    }
    
    public function index(Request $request)
    {
        $filter = $request->get('filter', 'inbox'); // inbox, important, trash, sent
        
        if ($filter === 'sent') {
            // Handle sent mail - show message responses
            $responses = MessageResponse::with(['admin', 'contactMessage.customer'])
                ->orderBy('xsw_ca', 'desc')
                ->paginate(15);
                
            // Get stats for the dashboard
            $stats = $this->getMessageStats();
            
            // Get all admins for assignment
            $admins = Admin::all();
            
            // Get counts for sidebar
            $inboxCount = ContactMessage::notDeleted()->count();
            $unreadMessagesCount = ContactMessage::notDeleted()->where('rty_ir', false)->count(); // is_read
            $importantCount = ContactMessage::important()->notDeleted()->count();
            $trashCount = ContactMessage::trashed()->count();
            $sentCount = MessageResponse::count();
            
            return view('admin.messages.messages-sent', compact('responses', 'stats', 'admins', 'unreadMessagesCount', 'inboxCount', 'importantCount', 'trashCount', 'sentCount', 'filter'));
        }
        
        $query = ContactMessage::with(['customer', 'assignedAdmin']);
        
        switch($filter) {
            case 'important':
                $query->important()->notDeleted();
                break;
            case 'trash':
                $query->trashed();
                break;
            default: // inbox
                $query->notDeleted();
                break;
        }
        
        $messages = $query->orderBy('zxc_ca', 'desc')->paginate(15);
            
        // Get stats for the dashboard
        $stats = $this->getMessageStats();
        
        // Get all admins for assignment
        $admins = Admin::all();
        
        // Get counts for sidebar
        $inboxCount = ContactMessage::notDeleted()->count();
        $unreadMessagesCount = ContactMessage::notDeleted()->where('rty_ir', false)->count(); // is_read
        $importantCount = ContactMessage::important()->notDeleted()->count();
        $trashCount = ContactMessage::trashed()->count();
        $sentCount = MessageResponse::count();
        
        return view('admin.messages.messages', compact('messages', 'stats', 'admins', 'unreadMessagesCount', 'inboxCount', 'importantCount', 'trashCount', 'sentCount', 'filter'));
    }

    /**
     * Get message statistics for the dashboard
     */
    private function getMessageStats()
    {
        $stats = [
            'by_status' => [
                ContactMessage::STATUS_NEW => ContactMessage::where('pkm_st', ContactMessage::STATUS_NEW)->count(), // status
                ContactMessage::STATUS_IN_PROGRESS => ContactMessage::where('pkm_st', ContactMessage::STATUS_IN_PROGRESS)->count(), // status
                ContactMessage::STATUS_RESOLVED => ContactMessage::where('pkm_st', ContactMessage::STATUS_RESOLVED)->count(), // status
                ContactMessage::STATUS_CLOSED => ContactMessage::where('pkm_st', ContactMessage::STATUS_CLOSED)->count(), // status
            ],
            'unassigned' => ContactMessage::whereNull('ujm_aid')->count(), // admin_id
            'total' => ContactMessage::count(),
        ];

        return $stats;
    }

    public function show(ContactMessage $message)
    {
        // Mark as read if not already read
        if (!$message->is_read) {
            $message->markAsRead();
        }
        
        // Load the responses relationship
        $message->load(['responses.admin']);
        
        return view('admin.messages.messages-single', compact('message'));
    }

    public function showSentMessage(MessageResponse $response)
    {
        // Load the relationships
        $response->load(['admin', 'contactMessage.customer']);
        
        return view('admin.messages.messages-sent-single', compact('response'));
    }

    public function markAsRead(Request $request,ContactMessage $message)
    {
        $message->markAsRead();
        
        // Broadcast the event
        //broadcast(new ContactMessageEvent())->toOthers();
       
        // Log assignment notification
        $admin = auth('admin')->user();
        $adminId = $request->input('admin_id', auth('admin')->id());
        $assignedAdmin = Admin::where('k1_id', $adminId)->first();

        Notification::create([
            'tya_tp'  => 'info',
            'uio_tt'  => 'Marked All Messages as Read',
            'asd_msg' => 'All messages marked as read by admin: ' . $admin->qwe_nm,
            'fgh_ic'  => 'bx bx-user-check',
            'jkl_cl'  => 'success',
            'zxc_at'  => 'update',
            'vbn_aid' => $adminId,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $adminId,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin->qwe_nm,
            'hjk_ue'  => $admin->rty_em,
            'kiu_ir'  => 0,
        ]);         
        return back()->with('success', 'Message marked as read.');
    }

    public function markAllAsRead(Request $request)
    {
        ContactMessage::notDeleted()->where('rty_ir', false)->update(['rty_ir' => true]);
        
        // Broadcast the event
        //broadcast(new ContactMessageEvent())->toOthers();

        // Log assignment notification
        $admin = auth('admin')->user();
        $adminId = $request->input('admin_id', auth('admin')->id());
        $assignedAdmin = Admin::where('k1_id', $adminId)->first();

        Notification::create([
            'tya_tp'  => 'info',
            'uio_tt'  => 'Marked All Messages as Read',
            'asd_msg' => 'All messages marked as read by admin: ' . $admin->qwe_nm,
            'fgh_ic'  => 'bx bx-user-check',
            'jkl_cl'  => 'success',
            'zxc_at'  => 'update',
            'vbn_aid' => $adminId,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $adminId,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin->qwe_nm,
            'hjk_ue'  => $admin->rty_em,
            'kiu_ir'  => 0,
        ]); 

        if (request()->expectsJson()) {
            return response()->json(['success' => true]);
        }

        return back()->with('success', 'All messages marked as read.');
    }

    public function destroy(ContactMessage $message)
    {
        $message->delete();
        
        // Broadcast the event
        //broadcast(new ContactMessageEvent())->toOthers();
        
        return redirect()->route('admin.messages.index')
            ->with('success', 'Message deleted successfully.');
    }

    public function respond(Request $request, ContactMessage $message)
    {
        $request->validate([
            'response' => 'required|string',
            'status' => 'nullable|string'
        ]);

        try {
            // Get the current admin
            $admin = auth('admin')->user();
            $newStatus = $request->status ?? ContactMessage::STATUS_RESOLVED;

            // Create new response record
            $response = $message->responses()->create([
                'admin_id' => $admin->id,
                'message' => $request->response,
            ]);

            // Update message status and assignment
            $message->update([
                'status' => $newStatus,
                'admin_id' => $message->admin_id ?? $admin->id, // Assign to current admin if not already assigned
                'last_update_time' => now()
            ]);

            // Send email to customer
            $emailSent = false;
            if ($message->customer && $message->customer->email) {
                try {
                    \Mail::to($message->customer->email)->send(
                        new \App\Mail\MessageReplyMail(
                            $message->customer,
                            $request->response,
                            $message,
                            $newStatus,
                            $admin->name
                        )
                    );
                    
                    $emailSent = true;
                    
                    // Log assignment notification
                    $admin = auth('admin')->user();
                    $adminId = $request->input('admin_id', auth('admin')->id());
                    $assignedAdmin = Admin::where('k1_id', $adminId)->first();

                    Notification::create([
                        'tya_tp'  => 'info',
                        'uio_tt'  => 'Reply email sent successfully',
                        'asd_msg' => 'Reply email sent to customer: ' . $message->customer->email,
                        'fgh_ic'  => 'bx bx-user-check',
                        'jkl_cl'  => 'success',
                        'zxc_at'  => 'update',
                        'vbn_aid' => $message->k3_id,
                        'nmq_am'  => ContactMessage::class,
                        'wer_uid' => $adminId,
                        'plm_ut'  => 'admin',
                        'sdf_un'  => $admin->qwe_nm,
                        'hjk_ue'  => $admin->rty_em,
                        'kiu_ir'  => 0,
                    ]); 

                    \Log::info('Reply email sent successfully', [
                        'customer_email' => $message->customer->email,
                        'message_id' => $message->id,
                        'admin_id' => $admin->id
                    ]);
                } 
                catch (\Exception $emailError) 
                {
                    // Log assignment notification
                    $admin = auth('admin')->user();
                    $adminId = $request->input('admin_id', auth('admin')->id());
                    $assignedAdmin = Admin::where('k1_id', $adminId)->first();

                    Notification::create([
                        'tya_tp'  => 'warning',
                        'uio_tt'  => 'Failed to send reply email',
                        'asd_msg' => 'Failed to send reply email: ' . $emailError->getMessage(),
                        'fgh_ic'  => 'bx bx-user-x',
                        'jkl_cl'  => 'danger',
                        'zxc_at'  => 'update',
                        'vbn_aid' => $message->k3_id,
                        'nmq_am'  => ContactMessage::class,
                        'wer_uid' => $adminId,
                        'plm_ut'  => 'admin',
                        'sdf_un'  => $admin->qwe_nm,
                        'hjk_ue'  => $admin->rty_em,
                        'kiu_ir'  => 0,
                    ]); 

                    \Log::error('Failed to send reply email', [
                        'error' => $emailError->getMessage(),
                        'customer_email' => $message->customer->email,
                        'message_id' => $message->id
                    ]);
                    // Don't fail the whole operation if email fails
                }
            } 
            else 
            {
                // Log assignment notification
                $admin = auth('admin')->user();
                $adminId = $request->input('admin_id', auth('admin')->id());
                $assignedAdmin = Admin::where('k1_id', $adminId)->first();

                Notification::create([
                    'tya_tp'  => 'warning',
                    'uio_tt'  => 'Cannot send reply email',
                    'asd_msg' => 'Customer or email not found',
                    'fgh_ic'  => 'bx bx-user-x',
                    'jkl_cl'  => 'danger',
                    'zxc_at'  => 'update',
                    'vbn_aid' => $message->k3_id,
                    'nmq_am'  => ContactMessage::class,
                    'wer_uid' => $adminId,
                    'plm_ut'  => 'admin',
                    'sdf_un'  => $admin->qwe_nm,
                    'hjk_ue'  => $admin->rty_em,
                    'kiu_ir'  => 0,
                ]); 

                \Log::warning('Cannot send reply email - customer or email not found', [
                    'message_id' => $message->id,
                    'has_customer' => !!$message->customer,
                    'customer_email' => $message->customer ? $message->customer->email : null
                ]);
            }

            // Broadcast the event
            //broadcast(new ContactMessageEvent())->toOthers();

            $successMessage = 'Response sent successfully';
            if ($emailSent) 
            {
                // Log assignment notification
                $admin = auth('admin')->user();
                $adminId = $request->input('admin_id', auth('admin')->id());
                $assignedAdmin = Admin::where('k1_id', $adminId)->first();

                Notification::create([
                    'tya_tp'  => 'info',
                    'uio_tt'  => 'Response sent successfully',
                    'asd_msg' => 'The response and email was sent successfully to the customer.',
                    'fgh_ic'  => 'bx bx-user-check',
                    'jkl_cl'  => 'success',
                    'zxc_at'  => 'update',
                    'vbn_aid' => $message->k3_id,
                    'nmq_am'  => ContactMessage::class,
                    'wer_uid' => $adminId,
                    'plm_ut'  => 'admin',
                    'sdf_un'  => $admin->qwe_nm,
                    'hjk_ue'  => $admin->rty_em,
                    'kiu_ir'  => 0,
                ]); 

                $successMessage .= ' and email notification sent to customer';

            } 
            else 
            {                
                // Log assignment notification
                $admin = auth('admin')->user();
                $adminId = $request->input('admin_id', auth('admin')->id());
                $assignedAdmin = Admin::where('k1_id', $adminId)->first();

                Notification::create([
                    'tya_tp'  => 'info',
                    'uio_tt'  => 'Response sent successfully but email failed',
                    'asd_msg' => 'The response was sent successfully but email notification failed to be sent to the customer.',
                    'fgh_ic'  => 'bx bx-user-x',
                    'jkl_cl'  => 'warning',
                    'zxc_at'  => 'update',
                    'vbn_aid' => $message->k3_id,
                    'nmq_am'  => ContactMessage::class,
                    'wer_uid' => $adminId,
                    'plm_ut'  => 'admin',
                    'sdf_un'  => $admin->qwe_nm,
                    'hjk_ue'  => $admin->rty_em,
                    'kiu_ir'  => 0,
                ]); 
                $successMessage .= ' (email notification could not be sent)';
            }

            if ($request->expectsJson()) {
                return response()->json([
                    'status' => 'success',
                    'message' => $successMessage
                ]);
            }

            return back()->with('success', $successMessage);

        } catch (\Exception $e) {
            \Log::error('Error in respond method', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'message_id' => $message->id
            ]);

            if ($request->expectsJson()) 
            {
                // Log assignment notification
                $admin = auth('admin')->user();
                $adminId = $request->input('admin_id', auth('admin')->id());
                $assignedAdmin = Admin::where('k1_id', $adminId)->first();

                Notification::create([
                    'tya_tp'  => 'warning',
                    'uio_tt'  => 'Message Response Failed',
                    'asd_msg' => 'Failed to send response. Please try again.',
                    'fgh_ic'  => 'bx bx-user-x',
                    'jkl_cl'  => 'danger',
                    'zxc_at'  => 'update',
                    'vbn_aid' => $message->k3_id,
                    'nmq_am'  => ContactMessage::class,
                    'plm_ut'  => 'admin',
                    'sdf_un'  => 'system',
                    'kiu_ir'  => 0,
                ]); 

                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to send response. Please try again.'
                ], 500);
            }

            return back()->withErrors(['response' => 'Failed to send response. Please try again.']);
        }
    }

    public function assign(Request $request, ContactMessage $message)
    {
        // If no admin_id is provided, assign to current admin
        $adminId = $request->input('admin_id', auth('admin')->id());
        
        // Validate the admin exists
        if ($adminId && !Admin::find($adminId)) {
            // Log assignment notification
            $admin = auth('admin')->user();
            $assignedAdmin = Admin::where('k1_id', $adminId)->first();

            Notification::create([
                'tya_tp'  => 'warning',
                'uio_tt'  => 'Message Assigned Failed',
                'asd_msg' => 'A contact message has been assigned to an invalid admin.',
                'fgh_ic'  => 'bx bx-user-x',
                'jkl_cl'  => 'danger',
                'zxc_at'  => 'update',
                'vbn_aid' => $message->k3_id,
                'nmq_am'  => ContactMessage::class,
                'plm_ut'  => 'admin',
                'sdf_un'  => 'system',
                'kiu_ir'  => 0,
            ]);            

            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid admin selected.'
                ], 400);
            }
            return back()->withErrors(['admin_id' => 'Invalid admin selected.']);
        }

        $message->update([
            'ujm_aid' => $adminId,
            'pkm_st'  => ContactMessage::STATUS_IN_PROGRESS,
        ]);

        // Log assignment notification
        $admin = auth('admin')->user();
        $assignedAdmin = Admin::where('k1_id', $adminId)->first();

        Notification::create([
            'tya_tp'  => 'info',
            'uio_tt'  => 'Message Assigned',
            'asd_msg' => 'A contact message has been assigned to ' . $assignedAdmin->qwe_nm,
            'fgh_ic'  => 'bx bx-user-check',
            'jkl_cl'  => 'primary',
            'zxc_at'  => 'update',
            'vbn_aid' => $message->k3_id,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $adminId,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin->qwe_nm,
            'hjk_ue'  => $admin->rty_em,
            'kiu_ir'  => 0,
        ]);

        
        // Broadcast the event
                    //broadcast(new ContactMessageEvent())->toOthers();
        
        if ($request->expectsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Message assigned successfully.'
            ]);
        }

        return back()->with('success', 'Message assigned successfully.');
    }

    public function toggleImportant(ContactMessage $message)
    {
        $isImportant = $message->toggleImportant();
        
        // Broadcast the event
                    //broadcast(new ContactMessageEvent())->toOthers();
        
        if (request()->expectsJson()) {
            return response()->json([
                'success' => true,
                'is_important' => $isImportant,
                'message' => $isImportant ? 'Message marked as important.' : 'Message unmarked as important.'
            ]);
        }
        
        return back()->with('success', $isImportant ? 'Message marked as important.' : 'Message unmarked as important.');
    }

    public function moveToTrash(Request $request, ContactMessage $message)
    {
        // Check if message is already in trash
        if ($message->is_deleted) {
            // If already in trash, permanently delete from database
            $message->delete();
            
            // Broadcast the event
            //broadcast(new ContactMessageEvent())->toOthers();

            // Log notification
            $admin = auth('admin')->user();
            $adminId = $request->input('admin_id', auth('admin')->id());

            Notification::create([
                'tya_tp'  => 'warning',
                'uio_tt'  => 'Message Removed Permanently',
                'asd_msg' => 'A contact message has been removed.',
                'fgh_ic'  => 'bx bx-trash',
                'jkl_cl'  => 'warning',
                'zxc_at'  => 'delete',
                'vbn_aid' => $message->k3_id,
                'nmq_am'  => ContactMessage::class,
                'wer_uid' => $adminId,
                'plm_ut'  => 'admin',
                'sdf_un'  => $admin->qwe_nm,
                'hjk_ue'  => $admin->rty_em,
                'kiu_ir'  => 0,
            ]);

            
            if (request()->expectsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Message permanently deleted from database.'
                ]);
            }
            
            return redirect()->route('admin.messages.index', ['filter' => 'trash'])
                ->with('success', 'Message permanently deleted from database.');
        } else {
            // If not in trash, move to trash (soft delete)
            $message->moveToTrash();
            
            // Broadcast the event
            //broadcast(new ContactMessageEvent())->toOthers();

            // Log notification
            $admin = auth('admin')->user();
            $adminId = $request->input('admin_id', auth('admin')->id());

            Notification::create([
                'tya_tp'  => 'warning',
                'uio_tt'  => 'Message Moved to Trash',
                'asd_msg' => 'A contact message has been moved to trash.',
                'fgh_ic'  => 'bx bx-trash',
                'jkl_cl'  => 'warning',
                'zxc_at'  => 'delete',
                'vbn_aid' => $message->k3_id,
                'nmq_am'  => ContactMessage::class,
                'wer_uid' => $adminId,
                'plm_ut'  => 'admin', 
                'sdf_un'  => $admin->qwe_nm,
                'hjk_ue'  => $admin->rty_em,
                'kiu_ir'  => 0,
            ]);

            
            if (request()->expectsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Message moved to trash.'
                ], 200);
            }
            
            return back()->with('success', 'Message moved to trash.');
        }
    }

    public function restoreFromTrash(Request $request,ContactMessage $message)
    {
        $message->restoreFromTrash();
        
        // Broadcast the event
        //broadcast(new ContactMessageEvent())->toOthers();

        // Log notification
        $admin = auth('admin')->user();
        $adminId = $request->input('admin_id', auth('admin')->id());

        Notification::create([
            'tya_tp'  =>'warning',
            'uio_tt'  => 'Message Restored',
            'asd_msg' => 'A contact message has been restored.',
            'fgh_ic'  => 'bx bx-undo',
            'jkl_cl'  => 'warning',
            'zxc_at'  => 'restore',
            'vbn_aid' => $message->k3_id,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $adminId,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin->qwe_nm,
            'hjk_ue'  => $admin->rty_em,
            'kiu_ir'  => 0,
        ]);
        
        \Log::info('STATUS', [
            'auth_admin' => auth('admin')->check(),
            'expectsJson' => request()->expectsJson(),
            'isAjax' => request()->ajax(),
        ]);

        
        if (request()->expectsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Message restored from trash.'
            ], 200);
        }
        
        return back()->with('success', 'Message restored from trash.');
    }

    public function permanentDelete(Request $request, ContactMessage $message)
    {
        $message->delete();
        
        // Broadcast the event
        //broadcast(new ContactMessageEvent())->toOthers();

        // Log notification
        $admin = auth('admin')->user();
        $adminId = $request->input('admin_id', auth('admin')->id());

        Notification::create([
            'tya_tp'  => 'warning',
            'uio_tt'  => 'Message Removed Permanently',
            'asd_msg' => 'A contact message has been removed.',
            'fgh_ic'  => 'bx bx-trash',
            'jkl_cl'  => 'warning',
            'zxc_at'  => 'delete',
            'vbn_aid' => $message->k3_id,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $adminId,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin->qwe_nm,
            'hjk_ue'  => $admin->rty_em,
            'kiu_ir'  => 0,
        ]);        

        if (request()->expectsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Message permanently deleted.'
            ]);
        }
        
        return redirect()->route('admin.messages.index', ['filter' => 'trash'])
            ->with('success', 'Message permanently deleted.');
    }

    public function getChatSuggestions()
    {
        $suggestions = PredefinedMessage::active()
            ->forChat()
            ->orderBy('category')
            ->orderBy('display_order')
            ->get();
            
        return response()->json($suggestions);
    }

    /**
     * Get auto response for public chat
     */
    public function getAutoResponse(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:1000'
        ]);

        try {
            // Use the existing ChatbotController logic
            $chatbotController = new \App\Http\Controllers\Admin\ChatbotController();
            return $chatbotController->getAutoResponse($request);
        } catch (\Exception $e) {
            \Log::error('Error in getAutoResponse', [
                'error' => $e->getMessage(),
                'message' => $request->message
            ]);

            return response()->json([
                'success' => false,
                'matched' => false,
                'message' => 'Error processing request'
            ], 500);
        }
    }

    /**
     * Get intelligent response using ML model for public chat
     */
    public function getIntelligentResponse(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:1000'
        ]);

        try {
            // Use the existing ChatbotController logic
            $chatbotController = new \App\Http\Controllers\Admin\ChatbotController();
            return $chatbotController->getIntelligentResponse($request);
        } catch (\Exception $e) {
            \Log::error('Error in getIntelligentResponse', [
                'error' => $e->getMessage(),
                'message' => $request->message
            ]);

            return response()->json([
                'success' => false,
                'type' => 'error',
                'message' => 'Error processing intelligent response'
            ], 500);
        }
    }

    /**
     * API endpoint for real-time message notifications
     */
    public function getMessageNotifications()
    {
        $unreadMessages = ContactMessage::where('rty_ir', false)->count(); // is_read
        $recentMessages = ContactMessage::with('customer')
            ->orderBy('zxc_ca', 'desc') // created_at
            ->take(5)
            ->get();

        return response()->json([
            'unread_count' => $unreadMessages,
            'recent_messages' => $recentMessages->map(function($message) {
                return [
                    'id' => $message->id,
                    'customer_name' => $message->customer->name ?? 'Unknown',
                    'customer_email' => $message->customer->email ?? '',
                    'subject' => $message->qwe_cat, // category
                    'content' => \Str::limit($message->olp_ct, 60), // content
                    'created_at' => $message->zxc_ca ? $message->zxc_ca->format('Y-m-d H:i:s') : null, // created_at
                    'time_ago' => $message->zxc_ca ? $message->zxc_ca->diffForHumans() : null, // created_at
                    'rty_ir' => $message->rty_ir // is_read
                ];
            })
        ]);
    }

    public function getOlpCtAttribute($value)
    {
        try {
            return Crypt::decryptString($value);
        } catch (\Throwable $e) {
            return $value;
        }
    }
}
