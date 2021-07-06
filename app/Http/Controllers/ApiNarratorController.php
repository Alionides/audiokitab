<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Narrator;
use App\Book;

class ApiNarratorController extends Controller
{
    //
    public function apiGetNarrator(Request $request){
        $narrator_id = $request->narrator_id;
        $data = Narrator::with('books')->where('id',$narrator_id)->first();
        return response($data);
    }
}
