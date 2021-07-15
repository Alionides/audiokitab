<?php

if (!function_exists('menu_display')) {
    function menu_display($menuName, $type = null, array       
       $options = [])
    {
        return \App\Menu::display($menuName, $type, $options);
    }
}


function reviewPercent($reviewdata,$reviewcount){
    $reviewpercent = 0;
    $reviewcount = $reviewcount == 0 ? 1 : $reviewcount; 
    foreach ($reviewdata as $r) {
        $reviewpercent += $r->review;
    }
    $reviewpercent = $reviewpercent/$reviewcount;
    return $reviewpercent;
}

