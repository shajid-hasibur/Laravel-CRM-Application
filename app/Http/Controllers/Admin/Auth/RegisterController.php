<?php
namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function register(Request $request){
        $admin = new Admin();

        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->username = $request->username;
        $admin->role_id = $request->role_id;
        $admin->password = Hash::make($request['password']);
        $admin->save();

        return redirect()->route('admin.login');
    }

    public function showRegisterForm(){
        return view('register');
    }
}