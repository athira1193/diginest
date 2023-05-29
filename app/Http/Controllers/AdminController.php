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

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:role');
    }
    public function index()
    {
        $post = DB::table('posts')
            ->join('users', 'users.id', '=', 'posts.created_by')
            ->select('posts.*', 'users.name as created_by_name', 'users.role as author_role')
            ->get();
        return response()->json([
            'success' => true,
            'message' => 'All Posts Listed Successfully',
            'data' => $post
        ], Response::HTTP_OK);
    }
    public function memberList()
    {
        $members = User::get();
        return response()->json([
            'success' => true,
            'message' => 'All members list',
            'data' => $members
        ], Response::HTTP_OK);
    }
    public function memberDetail($id)
    {

        $member_detail = User::where('id', $id)->first();
        return response()->json([
            'success' => true,
            'message' => 'Member Details',
            'data' => $member_detail
        ], Response::HTTP_OK);
    }
    public function studentList()
    {
        $studentlist = User::where('role', 'student')->get();
        return response()->json([
            'success' => true,
            'message' => 'List of all students',
            'data' => $studentlist
        ], Response::HTTP_OK);
    }
    public function teacherList()
    {
        $teacherList = User::where('role', 'teacher')->get();
        return response()->json([
            'success' => true,
            'message' => 'List of all teachers',
            'data' => $teacherList
        ], Response::HTTP_OK);
    }
    public function update(Request $request,$id)
    {
        $data = $request->only('name', 'email', 'password','role');
        $validator = Validator::make($data, [
            'name' => 'required|string',
            'password' => 'required|string|min:6|max:50',
            'role' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }
        $finduser = User::find($id);
        if($finduser)
        {
             User::where('id',$id)->update([
                'name' => $request->name,
                'password' => bcrypt($request->password),
                'role' => $request->role,
            ]);
            return response()->json([
                'success' => true,
                'message' => 'User updated successfully',
                'data' => $finduser
            ], Response::HTTP_OK);
        }
        else
        {
            return response()->json([
                'success' => true,
                'message' => 'User Not Found',
            ], Response::HTTP_OK);
        }

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
    public function addMember(Request $request)
    {
        $data = $request->only('name', 'email', 'password','role');
        $validator = Validator::make($data, [
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6|max:50',
            'role' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role' => $request->role,
        ]);
        return response()->json([
            'success' => true,
            'message' => 'User created successfully',
            'data' => $user
        ], Response::HTTP_OK);
    }
}
