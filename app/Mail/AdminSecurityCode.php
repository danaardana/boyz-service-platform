<?php

namespace App\Mail;

use App\Models\Admin;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Mail\Mailables\Address;

class AdminSecurityCode extends Mailable
{
    use Queueable, SerializesModels;

    public $admin;
    public $securityCode;

    /**
     * Create a new message instance.
     */
    public function __construct(Admin $admin, string $securityCode)
    {
        $this->admin = $admin;
        $this->securityCode = $securityCode;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Security Code for Password Reset - ' . $this->admin->name,
            from: new Address(config('mail.from.address'), config('mail.from.name')),
            replyTo: [new Address(config('mail.from.address'), config('mail.from.name'))],
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            html: 'admin.email.security_code',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
} 