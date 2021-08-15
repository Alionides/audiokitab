<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Book;
use App\Customeruser;
class ApiBookController extends Controller
{
    //
    public function apiGetBooksByCategoryId(Request $request){
            $cat_id = $request->category_id;
            //$data = Book::with('categories')->where('category_id',$cat_id)->paginate(1);
            $data = Book::whereJsonContains('categories',$cat_id)->get();//->paginate(1);
            //soundu yigisdirmag lazimdi
            return response($data);
    }

    public function apiGetBookDetail(Request $request){
            $book_id = $request->id;
            $token = strip_tags($request->token);
            $data = Book::with('author',"narrator")->where('id',$book_id)->where('isactive',1)->firstOrFail();
            

            $catarr = [];
            foreach (json_decode($data->categories) as $key => $value) {
               $cat = Category::where('id', $value)->first();
               $catarr[]=['id'=>$cat->id,'parent_id'=>$cat->parent_id,'title_az'=>$cat->title_az];
            }
            $book = [];
            $chapters = json_decode($data->chapters);
            if (is_array($chapters)){
                $count = count($chapters);
                if ($count <= 3) {
                    $newarr = array($chapters);
                }else{
                    $newarr = array_chunk($chapters, 3);
                }
            }
            
            $book['id'] = $data->id;
            $book['title_az'] = $data->title_az;
            $book['desc_az'] = $data->desc_az;
            $book['image'] = $data->image;
            $book['price'] = $data->price;
            $book['categories'] = $catarr; //$data->categories;
            $book['chapters'] = $newarr; 
            $book['narrator'] = $data->narrator;
            $book['author'] = $data->author;
            $book['author_id'] = $data->author_id;
            $book['narrator_id'] = $data->narrator_id;            
            $book['viewed'] = $data->viewed;
            $book['isage'] = $data->isage;            
            $book['isfree'] = $data->isfree;            
            $book['created_at'] = $data->created_at;

            if ($data->isfree === 0) {
                $book['sound'] = $data->sound; 
            }elseif($data->isfree === 1 && $data->price === 0){
                //check if user paid monthly 
                 $user = Customeruser::select('*')
                ->where('token', $token)
                ->first();
                if($user){
                    if($user->isactive === 1){
                        $book['sound'] = $data->sound;
                    }
                }else{
                    $book['sound'] = false;
                }
            }elseif($data->price > 0){
                //check if user paid for book
                $book['sound'] = 222;
            }

            return response($book);
    }

    // public function apiGetBook(Request $request){
    //     // $token = strip_tags($request->token); 
    //     // //return response($request->token);

    //     // $user = Customeruser::select('*')
    //     // ->where('token', $token)
    //     // ->first();

    //     // if($user){
    //         $data = Book::with('categories')->paginate(1);
    //         return response($data);
    //     // }

    // }
}
