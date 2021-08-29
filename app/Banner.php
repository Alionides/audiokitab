<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Banner extends Model
{
    public function books() {
        return $this->belongsTo(Book::class, 'book_id');
    }
}
