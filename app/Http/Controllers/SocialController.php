<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Validator,Redirect,Response,File;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Auth;
use Exception;

class SocialController extends Controller
{
    //

    public function redirect(){
        
        return Socialite::driver('google')->redirect();
    }

    public function callback(){
        try{
            $user_socialite = Socialite::driver('google')->user();
            $user = User::where('google_id', $user_socialite->id)->first();
            $user_same_email = User::where('email', $user_socialite->email)->first();

            if($user){
                Auth::login($user);
                return redirect ('/home');
            }elseif($user_same_email){
                // If email exists, update user with google_id for future google logins
                $user_same_email->google_id = $user_socialite->id;
                $user_same_email->save();
                Auth::login($user_same_email);
                return redirect ('/home');
            }else{
                $newUser = User::create(
                    [
                        'name' => $user_socialite->name,
                        'email' => $user_socialite->email,
                        'google_id' => $user_socialite->id,
                        'password' => encrypt('123456dummy'),
                    ]);
                    
                    // Fix Google Logged not verified. Works like a charm.
                    $newUser->email_verified_at = date('Y-m-d H:i:s');
                    $newUser->save();

                    Auth::login($newUser);
                    return redirect('/home');                    
            }
        } catch(Exception $e){
            dd($e->getMessage());
        }
    }
}
