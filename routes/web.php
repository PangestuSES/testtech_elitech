<?php

use Illuminate\Support\Facades\Route;

Route::get('/{vue_capture?}', function () {
    return view('welcome');
})->where('vue_capture', '[\/\w\.-]*');

// Route::get('/{any}', function () {
//     return view('app');
// })->where('any', '^(?!api).*$');

