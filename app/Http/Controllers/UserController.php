<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    
    public function index($id){

        $info = User::find($id);
        
        $consult=\DB::select("SELECT vs.`idv` AS idv,ht.`name` AS nameh,rm.`tipo` AS tipo,rm.`number` AS number, rm.`floor` AS floorr, vs.`fecha`,vs.`visits`
        FROM visits AS vs
        INNER JOIN users AS us ON us.`id` = vs.`idu`
        INNER JOIN hotels AS ht ON ht.`idh` = vs.`idh`
        INNER JOIN rooms AS rm ON rm.`idr` = ht.`idr`
        WHERE us.id = ?",[$id]);

        return view('profileInfo')
        ->with("info",$info)
        ->with("consult",$consult);

    }
}
