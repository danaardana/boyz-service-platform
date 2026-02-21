<?php

namespace App\Http\Controllers;

use App\Models\Technician;
use Illuminate\Support\Facades\Validator;
use App\Traits\EncryptHelperTrait;

class ServiceRequestController extends Controller
{
    use EncryptHelperTrait;

    /**
     * Display a listing of all technicians ordered by k11_id descending with pagination.
     */
    public function techniciansGrid()
    {
        $technicians = Technician::orderBy('t1_id', 'desc')->paginate(8);
        $technicianCount = Technician::all()->count();

        return view('admin.service.technicion-grid', compact('technicians', 'technicianCount'));
    }   
    
    public function techniciansList()
    {
        $technicians = Technician::orderBy('t1_id', 'desc')->paginate(8);
        $technicianCount = Technician::all()->count();

        return view('admin.service.technician-list', compact('technicians', 'technicianCount'));
    }

    public function technicianShow($id)
    {
        try {
            $tech = Technician::findOrFail($id);

            if (request()->ajax()) {
                return response()->json([
                    'success' => true,
                    'technician' => [
                        'id' => $tech->t1_id,
                        'name' => $tech->name,
                        'email' => $tech->email,
                        'phone' => $tech->phone,
                        'status' => $tech->t6_st,
                        'role' => $tech->t5_nt,
                        'notes' => $tech->t7_nt,
                        'created_at' => optional($tech->created_at)->format('M d, Y H:i'),
                        'updated_at' => optional($tech->updated_at)->format('M d, Y H:i'),
                    ]
                ]);
            }

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Technician not found'
            ], 404);
        }
    }

    public function technicianUpdate(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name'   => 'required|string|max:255',
            'email'  => 'nullable|email|max:255',
            'phone'  => 'nullable|string|max:20',
            'status' => 'required|in:active,inactive',
            'role'   => 'required|in:technician,identifier',
            'notes'  => 'nullable|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $tech = Technician::findOrFail($id);

            $tech->update([
                't2_nm' => $request->name,
                't3_em' => $request->email,
                't4_ph' => $request->phone,
                't5_nt'  => $request->role,
                't6_st' => $request->status,
                't7_nt' => $request->notes,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Technician updated successfully'
            ]);

        } catch (\Exception $e) {

            return response()->json([
                'success' => false,
                'message' => 'Failed to update technician'
            ], 500);
        }
    }

    public function technicianDestroy($id)
    {
        $technicians = Technician::orderBy('t1_id', 'desc')->paginate(8);
        $technicianCount = Technician::all()->count();

        return view('admin.service.technicion-grid', compact('technicians', 'technicianCount'));
    }


}