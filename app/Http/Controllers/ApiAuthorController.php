<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Author;
use App\Book;

class ApiAuthorController extends Controller
{
    //
    public function apiGetAuthor(Request $request){
        $author_id = $request->author_id;
        $data = Author::with('books')->where('id',$author_id)->first();
        return response($data);
    }
}
