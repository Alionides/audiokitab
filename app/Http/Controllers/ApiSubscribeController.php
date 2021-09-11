<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Subscription;
use App\Subscribeorder;
use App\Payment;

class ApiSubscribeController extends Controller
{
    //
    public function apiSaveSubscribeOrder(Request $request){

        // $user_id = strip_tags($request->user_id);
        // $subscribe_id = strip_tags($request->subscribe_id);
        // $username = strip_tags($request->username);
        // $subscribe_price = strip_tags($request->subscribe_price);
        // $subscribe_name = strip_tags($request->subscribe_name);
        // $subscribe_date = strip_tags($request->subscribe_date);

        $user_id = 1;
        $subscribe_id = 1;
        $username = 'Ali';
        $subscribe_price = 12000;
        $subscribe_name = '1 aylig paket';
        $subscribe_date = 1;
        $status = 'NOTAPPROVED';




        $data = new Subscribeorder;
        $data->user_id = $user_id;
        $data->subscribe_id = $subscribe_id;
        $data->username = $username;
        $data->subscribe_price = $subscribe_price;
        $data->subscribe_name = $subscribe_name;
        $data->subscribe_date = $subscribe_date;
        $data->status = $status;
        $data->save();
        
        // type 1 means the payment for subscription  type 2 means  book payment
        $type =1;
        
        $arr = array('type'=>$type,'payment_type_id'=>$data->id,'amount'=>$subscribe_price);
        $payment = new PaymentKapitalController;
        $payment->setAmount($arr);
        return $payment->createTestOrder();
        // if($data->save()){
        //     return response(200);
        // }
    }

}
