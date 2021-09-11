<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Customeruser;
use Illuminate\Support\Facades\Http;

class ApiCustomerUserController extends Controller
{
    //

    public function apiRegisterUser(Request $request){
        $email = strip_tags($request->email);
        $password = strip_tags($request->password);
        $repassword = $request->repassword;
        if($password === $repassword){
            $data = new Customeruser;
            $data->email = $email;
            $data->password = Hash::make($password);
            $data->status = 1;
            $data->isactive = 0;
            $data->save();
            return response($data);
        }else{
            return response(false);
        }
    }

    public function apiRegisterAndLogin(Request $request){
        $url = 'http://89.108.99.126/sendsmsapi/';
        $phone = strip_tags($request->phone);
        $code = rand(10000,99999);
        $xml = '
        <SMS-InsRequest>

            <CLIENT from="Klinika" pwd="pass123" user="cemilapi"/>
        
            <INSERT datacoding="0" to="'.$phone.'">
        
            <TEXT>'.$code.'</TEXT>
        
            </INSERT>
    
        </SMS-InsRequest>';

        $user = Customeruser::select('*')
        ->where('phone', $phone)
        ->first();

        if(!$user){
            $data = new Customeruser;
            $data->code = $code;
            $data->phone = $phone;
            $data->status = 1;
            $data->isactive = 0;
            $data->save();

            $response = Http::send('GET', $url, [
            'body' => $xml,
            ]);

            return response(true);
        }else{
            $user->code = $code;
            $user->save();
            $response = Http::send('GET', $url, [
                'body' => $xml,
            ]);
            return response(true);
        }
    }
    public function apiRegisterByPhone(Request $request){

        $url = 'http://89.108.99.126/sendsmsapi/';
        $phone = strip_tags($request->phone);
        $code = rand(10000,99999);
        $xml = '
        <SMS-InsRequest>

            <CLIENT from="Klinika" pwd="pass123" user="cemilapi"/>
        
            <INSERT datacoding="0" to="'.$phone.'">
        
            <TEXT>'.$code.'</TEXT>
        
            </INSERT>
    
        </SMS-InsRequest>';

        $user = Customeruser::select('*')
        ->where('phone', $phone)
        ->first();

        if(!$user){
            $data = new Customeruser;
            $data->code = $code;
            $data->phone = $phone;
            $data->status = 1;
            $data->isactive = 0;
            $data->save();

            $response = Http::send('GET', $url, [
            'body' => $xml,
            ]);

            return response(true);
        }else{
            return response(false);
        }

    }
    public function apiLoginByPhone(Request $request){
        $phone = strip_tags($request->phone);
        $code = strip_tags($request->code);
        $user = Customeruser::select('*')
        ->where('phone', $phone)
        ->first();
        

        if($user){
            //return response($code);
            //you cant search hashed string from db couse it always change need only to check;
            if($code == $user->code){
                
                $user->token = Hash::make($code.$phone);
                $user->save();

                $data = [];
                $data['name'] = $user->name;
                $data['email'] = $user->email;
                $data['status'] = $user->status;
                $data['isactive'] = $user->isactive;
                $data['token'] = $user->token;

                return response($data);
            }else{
                return response(false);
            }
        }else{
            return response(false);
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
            }else{
                return response(false);
            }
        }else{
            return response(false);
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
        $data['phone'] = $user->phone;
        $data['status'] = $user->status;
        $data['isactive'] = $user->isactive;
        $data['token'] = $user->token;
        
        return response($data);
    }
}
