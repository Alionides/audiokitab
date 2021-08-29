<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Book;
use App\Banner;

class ApiBannerController extends Controller
{
    public function apiGetBanners(Request $request){
        $data = Banner::with('books')->get();

        
        return response($data);
    }
}
