<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Narrator extends Model
{
    public function books() {
        return $this->hasMany(Book::class, 'narrator_id');
    }
}
