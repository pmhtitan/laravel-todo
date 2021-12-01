<?php

use App\Http\Controllers\SocialController;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use App\Http\Controllers\TaskController;

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

Route::get('/', function () {
    return view('welcome');
});

// Verify email
Route::get('/email/verify', function () {
    return view('auth.verify-email');
})->middleware('auth')->name('verification.notice');

Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
    $request->fulfill();
    return redirect('/home');
})->middleware(['auth', 'signed'])->name('verification.verify');

// Resend email verify
Route::post('/email/verification-notification', function (Request $request) {
    $request->user()->sendEmailVerificationNotification();

    return back()->with('message', 'Verification link sent!');
})->middleware(['auth', 'throttle:6,1'])->name('verification.send');

// home (redirect after verified)
Route::middleware(['auth:sanctum', 'verified'])->get('/home', [App\Http\Controllers\HomeController::class, 'home'])->name('home');

    // Display list of all our tasks
    // Add new tasks
    // Delete existing tasks

Route::middleware(['auth:sanctum', 'verified'])->group(function(){
    Route::get('/dashboard', [TaskController::class ,'dashboard' ])->name('dashboard');

    Route::get('/task',[TaskController::class, 'add']);
    Route::post('/task',[TaskController::class, 'create']);
    
    Route::get('/task/{task}', [TaskController::class, 'edit']);
    Route::post('/task/{task}', [TaskController::class, 'update']);
});

// Google Login Laravel Socialite
Route::get('redirect', [SocialController::class, 'redirect']);
Route::get('callback', [SocialController::class, 'callback']);

