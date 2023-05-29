<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use App\Models\user;
use Illuminate\Support\Facades\DB;

class SubAdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:role');
    }
    public function postApproval(Request $request,$id)
    {
        $data = $request->only('status');
        $validator = Validator::make($data, [
            'status' => 'required|string'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }
        $findpost = Post::find($id);
        if($findpost)
        {
            Post::where('id',$id)->update([
                'status' => $request->status,
                'approved_by' => JWTAuth::user()->id
            ]);
            return response()->json([
                'success' => true,
                'message' => 'User updated successfully',
                'data' => $findpost
            ], Response::HTTP_OK);
        }
        else
        {
            return response()->json([
                'success' => true,
                'message' => 'Post Not Found',
            ], Response::HTTP_OK);
        }
    }
}
