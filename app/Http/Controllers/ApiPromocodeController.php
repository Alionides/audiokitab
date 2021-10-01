<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Promocodelist;
use App\Promocodeorder;
use App\Subscription;

class ApiPromocodeController extends Controller
{
    //
    public function apiPromocodeOrder(Request $request){

        $user_id = strip_tags($request->user_id);
        $username = strip_tags($request->username);
        $promocode = strip_tags($request->promocode);

        $status = 'APPROVED';

        $promocodelist = Promocodelist::where('code',$promocode)->where('status',1)->first();

        if(!$promocodelist){
            return response([]);
        }
        
        $subscription = Subscription::where('id',$promocodelist->subscribe_id)->first();
        $total_month = $subscription->tarix;
        
        $now = Carbon::today();
        $expire_at = $now->add($total_month, 'month');
        //return response($expire_at);
        $data = new Promocodeorder;
        $data->user_id = $user_id;
        $data->promocode = $promocode;
        $data->username = $username;
        $data->status = $status;
        $data->expire_at = $expire_at;
        $data->save();

        $promocodelist->status = 0;
        $promocodelist->save();


    }
}
