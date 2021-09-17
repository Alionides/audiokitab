<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Booklike extends Model
{
    public function booklike() {
        return $this->belongsTo(Book::class, 'book_id');
    }
}
