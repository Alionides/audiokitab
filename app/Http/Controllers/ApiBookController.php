<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Category;
use App\Book;
use App\Customeruser;
use App\Bookorder;
use App\Payment;
use App\Subscribeorder;
use App\Booklike;

class ApiBookController extends Controller
{
    //
    public function apiGetRecommendedBooks(Request $request){
        $data = Book::where('recommended',1)->where('isactive',1)->get();
        if($data->isEmpty()){
            return response(400);
        }
        $book = [];
        $book['id'] = $data[0]['id'];
        $book['title_az'] = $data[0]['title_az'];
        $book['image'] = $data[0]['image'];
        $book['price'] = $data[0]['price'];
        $book['author'] = $data[0]['author'];

        return response($data);
    }

    public function apiSearchBooks(Request $request){
        $search = strip_tags($request->search);
        $data = Book::where('title_az' ,'LIKE','%'.$search.'%')
        ->where('isactive',1)
        ->get();
       
        if($data->isEmpty()){
            return response(400);
        }

        $book = [];
        $book['id'] = $data[0]['id'];
        $book['title_az'] = $data[0]['title_az'];
        $book['image'] = $data[0]['image'];
        $book['price'] = $data[0]['price'];
        $book['author'] = $data[0]['author'];

         return response($data);
    }
    public function apiGetMyBooks(Request $request){
        $user_id = strip_tags($request->user_id);
        $data = Bookorder::with('bookorder')
        ->where('user_id',$user_id)
        ->get();
       
        if($data->isEmpty()){
            return response(400);
        }

        $book = [];
        $book['id'] = $data[0]['id'];
        $book['title_az'] = $data[0]['title_az'];
        $book['image'] = $data[0]['image'];
        $book['price'] = $data[0]['price'];
        $book['author'] = $data[0]['author'];

         return response($data);
    }
    public function apiGetLikedBooks(Request $request){
        $user_id = strip_tags($request->user_id);
        $data = Booklike::with('booklike')
        ->where('user_id',$user_id)
        ->get();
       
        if($data->isEmpty()){
            return response(400);
        }

        $book = [];
        $book['id'] = $data[0]['id'];
        $book['title_az'] = $data[0]['title_az'];
        $book['image'] = $data[0]['image'];
        $book['price'] = $data[0]['price'];
        $book['author'] = $data[0]['author'];

         return response($data);
    }

    public function apiLikeBook(Request $request){
        $user_id = strip_tags($request->user_id);
        $book_id = strip_tags($request->book_id);
        $data = new Booklike;
        $data->user_id = $user_id;
        $data->book_id = $book_id;
        $data->save();
        if($data){
            return response(200);
        }

    }

    public function apiBookOrder(Request $request){

        $user_id = strip_tags($request->user_id);
        $book_id = strip_tags($request->book_id);
        $username = strip_tags($request->username);
        $book_price = strip_tags($request->book_price);

       

        // $user_id = 1;
        // $book_id = 1;
        // $username = 'Ali';
        // $book_price = 1000;

        $status = 'NOTAPPROVED';




        $data = new Bookorder;
        $data->user_id = $user_id;
        $data->book_id = $book_id;
        $data->username = $username;
        $data->book_price = $book_price;
        $data->status = $status;
        $data->save();
        
        // type 1 means the payment for subscription  type 2 means  book payment
        $type =2;

        $arr = array('type'=>$type,'payment_type_id'=>$data->id,'amount'=>$book_price);
        $payment = new PaymentKapitalController;
        $payment->setAmount($arr);
        return $payment->createTestOrder();
        // if($data->save()){
        //     return response(200);
        // }
    }

    public function apiGetBooksByCategoryId(Request $request){
            $cat_id = $request->category_id;
            //$data = Book::with('categories')->where('category_id',$cat_id)->paginate(1);
            $data = Book::whereJsonContains('categories',$cat_id)->where('isactive',1)->get();//->paginate(1);
            //soundu yigisdirmag lazimdi
            if($data->isEmpty()){
                return response(400);
            }
            return response($data);
    }

    public function apiGetBookDetail(Request $request){
            $book_id = $request->id;
            $token = strip_tags($request->token);
            $data = Book::with('author',"narrator")->where('id',$book_id)->where('isactive',1)->firstOrFail();
            if($data->isEmpty()){
                return response(400);
            }

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

            $user = Customeruser::where('token', $token)->first();
            $bookorder = Bookorder::select('*')
            ->where('user_id',$user->id)
            ->where('book_id',$data->id)
            ->first();

            if($bookorder == false){
                $bookorderstatus = false;
            }elseif ($bookorder->status === 'APPROVED') {
                $bookorderstatus = true;
            }else{
                $bookorderstatus = false;
            }

            
            
            $subscribeorder = Subscribeorder::where('user_id',$user->id)
            ->latest()->first();

            if($subscribeorder == false){
                $diff = -1;
            }else{
                $now = Carbon::now();     
                //$now = Carbon::create('2020-10-02 08:09:34');       
                $subscribetime = $subscribeorder->created_at;
                $diff = $now->diffInMinutes($subscribetime->add($subscribeorder->subscribe_date, 'month'), false);
            }

            


            if ($data->price > 0 && $bookorderstatus == true) {
                $book['sound'] = $data->sound;
            }
            elseif ($data->issubscribe > 0  && $diff > 0) {
                $book['sound'] = $data->sound;
            }
            else{
                $book['sound'] = false;
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
