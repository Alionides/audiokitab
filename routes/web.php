<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\ApiCustomerUserController;
use App\Http\Controllers\ApiCategoryController;
use App\Http\Controllers\ApiBookController;
use App\Http\Controllers\ApiNarratorController;
use App\Http\Controllers\ApiAuthorController;

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
});

Route::get('/', [SiteController::class, 'index'])->name('homepage');
Route::post('apiregisteruser', [ApiCustomerUserController::class, 'apiRegisterUser']);
Route::post('apiloginuser', [ApiCustomerUserController::class, 'apiLoginUser']);
Route::post('apiloginbytoken', [ApiCustomerUserController::class, 'apiLoginByToken']);
Route::post('apigetcategory', [ApiCategoryController::class, 'apiGetCategory']);
Route::get('apigetbook', [ApiBookController::class, 'apiGetBook']);
Route::post('apigetbookdetail', [ApiBookController::class, 'apiGetBookDetail']);
Route::get('apigetbooksbycategoryid', [ApiBookController::class, 'apiGetBooksByCategoryId']);
Route::post('apigetnarrator', [ApiNarratorController::class, 'apiGetNarrator']);
Route::post('apigetauthor', [ApiAuthorController::class, 'apiGetAuthor']);