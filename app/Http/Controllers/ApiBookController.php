<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use App\Category;
use App\Book;
use App\Customeruser;
use App\Bookorder;
use App\Payment;
use App\Subscribeorder;
use App\Booklike;
use App\Promocodeorder;

class ApiBookController extends Controller
{
    //
    public function apiGetNewBooks(Request $request){
        $now = Carbon::today();
        $data = Book::where('created_at', '>=', $now->sub('1 month'))->get();
        $book = [];
        foreach ($data as $key => $value) {
            $book[$key]['id'] = $value['id'];
            $book[$key]['title_az'] = $value['title_az'];
            $book[$key]['image'] = is_null($value['image']) ? null :  url('').Storage::url($value['image']);
            $book[$key]['price'] = $value['price'];
            $book[$key]['author'] = $value['author'];
        }
        return response($book);
    }
    public function apiGetRecommendedBooks(Request $request){
        $data = Book::where('recommended',1)->where('isactive',1)->get();
        if($data->isEmpty()){
            return response([]);
        }
        $book = [];
        // $book['id'] = $data[0]['id'];
        // $book['title_az'] = $data[0]['title_az'];
        // $book['image'] = $data[0]['image'];
        // $book['price'] = $data[0]['price'];
        // $book['author'] = $data[0]['author'];

        foreach ($data as $key => $value) {
            $book[$key]['id'] = $value['id'];
            $book[$key]['title_az'] = $value['title_az'];
            $book[$key]['image'] = is_null($value['image']) ? null :  url('').Storage::url($value['image']);
            $book[$key]['price'] = $value['price'];
            $book[$key]['author'] = $value['author'];
        }

        return response($book);
    }

    public function apiSearchBooks(Request $request){
        $search = strip_tags($request->search);
        $data = Book::where('title_az' ,'LIKE','%'.$search.'%')
        ->where('isactive',1)
        ->get();
       
        if($data->isEmpty()){
            return response([]);
        }

        $book = [];
        // $book['id'] = $data[0]['id'];
        // $book['title_az'] = $data[0]['title_az'];
        // $book['image'] = $data[0]['image'];
        // $book['price'] = $data[0]['price'];
        // $book['author'] = $data[0]['author'];
        foreach ($data as $key => $value) {
            $book[$key]['id'] = $value['id'];
            $book[$key]['title_az'] = $value['title_az'];
            $book[$key]['image'] = is_null($value['image']) ? null :  url('').Storage::url($value['image']);
            $book[$key]['price'] = $value['price'];
            $book[$key]['author'] = $value['author'];
        }

         return response($book);
    }
    public function apiGetMyBooks(Request $request){
        $user_id = strip_tags($request->user_id);
        $data = Bookorder::with('bookorder')
        ->where('user_id',$user_id)
        ->get();
       
        if($data->isEmpty()){
            return response([]);
        }

        $book = [];
        // $book['id'] = $data[0]['id'];
        // $book['title_az'] = $data[0]['title_az'];
        // $book['image'] = $data[0]['image'];
        // $book['price'] = $data[0]['price'];
        // $book['author'] = $data[0]['author'];
        
        foreach ($data as $key => $value) {
            $book[$key]['id'] = $value['bookorder']['id'];
            $book[$key]['title_az'] = $value['bookorder']['title_az'];
            $book[$key]['image'] = is_null($value['bookorder']['image']) ? null :  url('').Storage::url($value['bookorder']['image']);
            $book[$key]['price'] = $value['bookorder']['price'];
            $book[$key]['author'] = $value['bookorder']['author'];
        }

         return response($book);
    }
    public function apiGetLikedBooks(Request $request){
        $user_id = strip_tags($request->user_id);
        $data = Booklike::with('booklike')
        ->where('user_id',$user_id)
        ->get();
       
        if($data->isEmpty()){
            return response([]);
        }

        $book = [];

        foreach ($data as $key => $value) {
            $book[$key]['id'] = $value['booklike']['id'];
            $book[$key]['title_az'] = $value['booklike']['title_az'];
            $book[$key]['image'] = is_null($value['booklike']['image']) ? null :  url('').Storage::url($value['booklike']['image']);
            $book[$key]['price'] = $value['booklike']['price'];
            $book[$key]['author'] = $value['booklike']['author'];
        }

         return response($book);
    }

    public function apiLikeBook(Request $request){
        $user_id = strip_tags($request->user_id);
        $book_id = strip_tags($request->book_id);
        $book = Booklike::where('user_id',$user_id)->where('book_id',$book_id)->get();
        
        if(count($book) == 0){
            $data = new Booklike;
            $data->user_id = $user_id;
            $data->book_id = $book_id;
            $data->save();
            if($data){
                return response(200);
            }
        }else{
                return response(400);
        }

    }
    public function apiUnlikeBook(Request $request){
        $user_id = strip_tags($request->user_id);
        $book_id = strip_tags($request->book_id);
        $book = Booklike::where('user_id',$user_id)->where('book_id',$book_id)->delete();
        
        if($book){
                return response(200);
        }else{
                return response(400);
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
            $data = Book::whereJsonContains('categories',$cat_id)->where('isactive',1)->get();
            //->paginate(1);
            //soundu yigisdirmag lazimdi

            //$sound = url('').Storage::url((json_decode($data[0]->sound))[0]->download_link);
            //return response($a);
            if($data->isEmpty()){
                return response([]);
            }
            $book = [];
            // $book['id'] = $data[0]['id'];
            // $book['title_az'] = $data[0]['title_az'];
            // $book['image'] = $data[0]['image'];
            // $book['price'] = $data[0]['price'];
            // $book['author'] = $data[0]['author'];
            foreach ($data as $key => $value) {
                $book[$key]['id'] = $value['id'];
                $book[$key]['title_az'] = $value['title_az'];
                $book[$key]['image'] = is_null($value['image']) ? null :  url('').Storage::url($value['image']);
                $book[$key]['price'] = $value['price'];
                $book[$key]['author'] = $value['author'];
            }

            return response($book);
    }

    public function apiGetBookDetail(Request $request){
            $book_id = $request->id;
            $token = strip_tags($request->token);
            $data = Book::with('author',"narrator")->where('id',$book_id)->where('isactive',1)->first();
            //if($data->isEmpty()){
            if(!$data){
                return response([]);
            }

            $sound = url('').Storage::url((json_decode($data->sound))[0]->download_link);

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
            $book['image'] = is_null($data->image) ? null :  url('').Storage::url($data->image);
            $book['start'] = $data->start;
            $book['end'] = $data->end;
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
            $promocodeorder = Promocodeorder::where('user_id',$user->id)->where('status','APPROVED')
            ->latest()->first();

            $now = Carbon::now();

            // abunelik ucun
            if($subscribeorder == false){
                $diff = -1;
            }else{ 
                $subscribetime = $subscribeorder->created_at;
                $diff = $now->diffInMinutes($subscribetime->add($subscribeorder->subscribe_date, 'month'), false);
            }

            //promo ucun
            if($promocodeorder == false){
                $promodiff = -1;
            }else{
                $promodiff = $now->diffInMinutes($promocodeorder->expire_at, false);
            }

            


            if ($data->price > 0 && $bookorderstatus == true) {
                $book['sound'] = $sound;
            }
            elseif ($data->issubscribe > 0  && $diff > 0) {
                $book['sound'] = $sound;
            }elseif ($data->issubscribe > 0  && $promodiff > 0){
                $book['sound'] = $sound;
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
