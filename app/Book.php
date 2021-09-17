<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Book extends Model
{    
    public function categories() {
        return $this->hasMany(Category::class, 'category_id');
    }
    public function narrator() {
        return $this->belongsTo(Narrator::class, 'narrator_id');
    }
    public function author() {
        return $this->belongsTo(Author::class, 'author_id');
    }
}
