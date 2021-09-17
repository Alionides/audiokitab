<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        //
        'http://127.0.0.1:8000/apiregisteruser',
        'http://127.0.0.1:8000/apiregisterandlogin',
        'http://127.0.0.1:8000/apiregisterbyphone',
        'http://127.0.0.1:8000/apiloginbyphone',
        'http://127.0.0.1:8000/apiloginuser',
        'http://127.0.0.1:8000/apiloginbytoken',
        'http://127.0.0.1:8000/apigetcategory',
        'http://127.0.0.1:8000/apigetbook',
        'http://127.0.0.1:8000/apigetbookdetail',
        'http://127.0.0.1:8000/apigetbooksbycategoryid',
        'http://127.0.0.1:8000/apigetnarrator',
        'http://127.0.0.1:8000/apigetauthor',
        'http://127.0.0.1:8000/apigetbanners',
        'http://127.0.0.1:8000/apibookorder',        
        'http://127.0.0.1:8000/apisubscribeorder',        
        'http://127.0.0.1:8000/approve',
        'http://127.0.0.1:8000/cancel',
        'http://127.0.0.1:8000/decline',
        'http://127.0.0.1:8000/apigetsubscribe',
        'http://127.0.0.1:8000/apigetrecommendedbooks',
        'http://127.0.0.1:8000/apisearchbooks',
        'http://127.0.0.1:8000/apigetmybooks',
        'http://127.0.0.1:8000/apilikebook',
    ];
}
