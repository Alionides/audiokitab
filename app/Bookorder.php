<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Bookorder extends Model
{
    public function bookorder() {
        return $this->belongsTo(Book::class, 'book_id');
    }
}
