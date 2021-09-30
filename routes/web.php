<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\ApiCustomerUserController;
use App\Http\Controllers\ApiCategoryController;
use App\Http\Controllers\ApiBookController;
use App\Http\Controllers\ApiNarratorController;
use App\Http\Controllers\ApiAuthorController;
use App\Http\Controllers\ApiBannerController;
use App\Http\Controllers\ApiSubscribeController;
use App\Http\Controllers\ApiPageController;
use App\Http\Controllers\PaymentKapitalController;
use App\Http\Controllers\Voyager\BooksController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::get('soundfile', [BooksController::class, 'soundfile']);
});

Route::get('/', [SiteController::class, 'index'])->name('homepage');
Route::post('apiregisteruser', [ApiCustomerUserController::class, 'apiRegisterUser']);
Route::post('apiregisterandlogin', [ApiCustomerUserController::class, 'apiRegisterAndLogin']);
Route::post('apiregisterbyphone', [ApiCustomerUserController::class, 'apiRegisterByPhone']);
Route::post('apiloginbyphone', [ApiCustomerUserController::class, 'apiLoginByPhone']);
Route::post('apiloginuser', [ApiCustomerUserController::class, 'apiLoginUser']);
Route::post('apiloginbytoken', [ApiCustomerUserController::class, 'apiLoginByToken']);
Route::post('apigetcategory', [ApiCategoryController::class, 'apiGetCategory']);
Route::get('apigetbook', [ApiBookController::class, 'apiGetBook']);
Route::post('apigetbookdetail', [ApiBookController::class, 'apiGetBookDetail']);
Route::get('apigetbooksbycategoryid', [ApiBookController::class, 'apiGetBooksByCategoryId']);
Route::post('apigetnarrator', [ApiNarratorController::class, 'apiGetNarrator']);
Route::post('apigetauthor', [ApiAuthorController::class, 'apiGetAuthor']);
Route::post('apigetbanners', [ApiBannerController::class, 'apiGetBanners']);
Route::post('apisubscribeorder', [ApiSubscribeController::class, 'apiSubscribeOrder']);
Route::post('apibookorder', [ApiBookController::class, 'apiBookOrder']);
Route::post('approve', [PaymentKapitalController::class, 'approveUrl']);
Route::post('cancel', [PaymentKapitalController::class, 'cancelUrl']);
Route::post('decline', [PaymentKapitalController::class, 'declineUrl']);
Route::post('apigetsubscribe', [ApiSubscribeController::class, 'apiGetSubscribe']);
Route::post('apigetrecommendedbooks', [ApiBookController::class, 'apiGetRecommendedBooks']);
Route::post('apisearchbooks', [ApiBookController::class, 'apiSearchBooks']);
Route::post('apigetmybooks', [ApiBookController::class, 'apiGetMyBooks']);
Route::post('apigetlikedbooks', [ApiBookController::class, 'apiGetLikedBooks']);
Route::post('apilikebook', [ApiBookController::class, 'apiLikeBook']);
Route::post('apigetpages', [ApiPageController::class, 'apiGetPages']);
Route::post('apigetpagebyid', [ApiPageController::class, 'apiGetPageById']);
Route::post('apigetnewbooks', [ApiBookController::class, 'apiGetNewBooks']);
Route::post('apiunlikebook', [ApiBookController::class, 'apiUnlikeBook']);
Route::post('apipromocodeorder', [ApiBookController::class, 'apiPromocodeOrder']);

