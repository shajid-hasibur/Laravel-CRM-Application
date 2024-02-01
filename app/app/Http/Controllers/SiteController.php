<?php

namespace App\Http\Controllers;

use App\Constants\Status;
use App\Models\AdminNotification;
use App\Models\Frontend;
use App\Models\Language;
use App\Models\Page;
use App\Models\SupportMessage;
use App\Models\SupportTicket;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class SiteController extends Controller
{
    
    public function placeholderImage($size = null){
        $imgWidth = explode('x',$size)[0];
        $imgHeight = explode('x',$size)[1];
        $text = $imgWidth . '×' . $imgHeight;
        $fontFile = realpath('assets/font/RobotoMono-Regular.ttf');
        $fontSize = round(($imgWidth - 50) / 8);
        if ($fontSize <= 9) {
            $fontSize = 9;
        }
        if($imgHeight < 100 && $fontSize > 30){
            $fontSize = 30;
        }

        $image     = imagecreatetruecolor($imgWidth, $imgHeight);
        $colorFill = imagecolorallocate($image, 100, 100, 100);
        $bgFill    = imagecolorallocate($image, 175, 175, 175);
        imagefill($image, 0, 0, $bgFill);
        $textBox = imagettfbbox($fontSize, 0, $fontFile, $text);
        $textWidth  = abs($textBox[4] - $textBox[0]);
        $textHeight = abs($textBox[5] - $textBox[1]);
        $textX      = ($imgWidth - $textWidth) / 2;
        $textY      = ($imgHeight + $textHeight) / 2;
        header('Content-Type: image/jpeg');
        imagettftext($image, $fontSize, 0, $textX, $textY, $colorFill, $fontFile, $text);
        imagejpeg($image);
        imagedestroy($image);
    }

    public function maintenance()
    {
        $pageTitle = 'Maintenance Mode';
        $general = gs();
        if($general->maintenance_mode == Status::DISABLE){
            return to_route('home');
        }
        $maintenance = Frontend::where('data_keys','maintenance.data')->first();
        return view('templates.basic.maintenance',compact('pageTitle','maintenance'));
    }

    public function policyPages($slug,$id)
    {
        $policy = Frontend::where('id',$id)->where('data_keys','policy_pages.element')->firstOrFail();
        $pageTitle = $policy->data_values->title;
        return view('templates.basic.policy',compact('policy','pageTitle'));
    }

    public function contact(){
        $pageTitle = "Contact Us";
        return view('contact',compact('pageTitle'));
    }

    public function contactSubmit(Request $request)
    {
        $tech = User::where('email', $request->email)->first();
        if(!$tech){
            $this->validate($request, [
                'name' => 'required',
                'email' => 'required',
                'subject' => 'required|string|max:255',
                'message' => 'required',
            ]);
        }else{
            $this->validate($request, [
                'email' => 'required',
                'subject' => 'required|string|max:255',
                'message' => 'required',
            ]);
        }

        $request->session()->regenerateToken();

        $random = getNumber();

        $ticket = new SupportTicket();
        $ticket->user_id = auth()->id() ?? $tech->id ?? 0;
        $ticket->site_id = $request->site_id ?? 0;
        $ticket->name = $request->name ?? $tech->firstname .$tech->lastname;
        $ticket->email = $request->email;
        if ($tech) {
            $ticket->priority = Status::PRIORITY_HIGH;
        } else {
            $ticket->priority = Status::PRIORITY_MEDIUM;
        }
        $ticket->ticket = $random;
        $ticket->subject = $request->subject;
        $ticket->last_reply = Carbon::now();
        $ticket->status = Status::TICKET_OPEN;
        $ticket->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = auth()->user() ? auth()->user()->id : 0;
        $adminNotification->title = 'A new support ticket has opened ';
        $adminNotification->click_url = urlPath('admin.ticket.view', $ticket->id);
        $adminNotification->save();

        $message = new SupportMessage();
        $message->support_ticket_id = $ticket->id;
        $message->message = $request->message;
        $message->save();

        if ($tech) {
            notify($tech, 'ADMIN_ASSIGN_SUPPORT_TICKET', [
                'ticket_id' => $ticket->ticket,
                'ticket_subject' => $ticket->subject,
                'reply' => $request->message,
                'link' => route('ticket.view', $ticket->ticket),
            ]);
        }

        if($tech){
            $notify[] = ['success', 'Ticket created successfully!'];
        }else{
            $notify[] = ['success', 'Data submitted successfully!'];
        }

        return back()->withNotify($notify);
    }

    public function test(){
        $pageTitle = "UUU";
        return view('test',compact('pageTitle'));
    }

}
