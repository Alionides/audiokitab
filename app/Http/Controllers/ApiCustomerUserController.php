<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Customeruser;

class ApiCustomerUserController extends Controller
{
    //

    public function apiRegisterUser(Request $request){
        $email = $request->email;
        $password = $request->password;
        $repassword = $request->repassword;
        if($password === $repassword){
            $data = new Customeruser;
            $data->email = $email;
            $data->password = Hash::make($password);
            $data->status = 1;
            $data->isactive = 0;
            $data->save();
            return response($data);
        }
    }
    public function apiLoginUser(Request $request){
        $email = strip_tags($request->email);
        $password = strip_tags($request->password);

        $user = Customeruser::select('*')
        ->where('email', $email)
        ->first();

        if($user){
            //you cant search hashed string from db couse it always change need only to check;
            if($email === $user->email && Hash::check($password, $user->password) ){
                
                $user->token = Hash::make($password);
                $user->save();

                $data = [];
                $data['name'] = $user->name;
                $data['email'] = $user->email;
                $data['status'] = $user->status;
                $data['isactive'] = $user->isactive;
                $data['token'] = $user->token;

                return response($data);
            }
        }        
    }
    public function apiLoginByToken(Request $request){
        $token = strip_tags($request->token);    
        $user = Customeruser::select('*')
        ->where('token', $token)
        ->first();

        $data = [];
        $data['name'] = $user->name;
        $data['email'] = $user->email;
        $data['status'] = $user->status;
        $data['isactive'] = $user->isactive;
        $data['token'] = $user->token;
        
        return response($data);
    }
}
