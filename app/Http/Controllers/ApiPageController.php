<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Page;

class ApiPageController extends Controller
{
    public function apiGetPages(Request $request){
        $data = Page::get();
        return response($data);
    }
    public function apiGetPageById(Request $request){
        $page_id = strip_tags($request->page_id);
        $data = Page::where('id',$page_id)->get();
        if($data->isEmpty()){
            return response([]);
        }
        return response($data);
    }
}
