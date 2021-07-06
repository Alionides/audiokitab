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
        'http://127.0.0.1:8000/apiloginuser',
        'http://127.0.0.1:8000/apiloginbytoken',
        'http://127.0.0.1:8000/apigetcategory',
        'http://127.0.0.1:8000/apigetbook',
        'http://127.0.0.1:8000/apigetbookdetail',
        'http://127.0.0.1:8000/apigetbooksbycategoryid',
        'http://127.0.0.1:8000/apigetnarrator',
        'http://127.0.0.1:8000/apigetauthor',
    ];
}
