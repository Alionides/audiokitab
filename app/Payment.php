<?php

namespace App;
//namespace App\Models;

//use App\Database\EloquentModel as Model;

use Illuminate\Database\Eloquent\Model;


class Payment extends Model
{
    protected $fillable = ['payment_type','payment_type_id','order_id', 'session_id', 'currency', 'order_status', 'order_description', 'amount', 'payment_url', 'status_code','order_check_status','language_code',];

}
