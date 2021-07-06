<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Book;

class ApiCategoryController extends Controller
{
    //
    public function apiGetCategory(Request $request){

        $data = Category::withcount('products')->get();

        $cats = [];
        foreach ($data as $key => $value) {
            $books = Book::whereJsonContains('categories',strval($value->id))->get();

            $cats[]=['id'=>$value->id,'title_az'=>$value->title_az,'count'=>count($books)];
        }
        return response($cats);

    }

}
