<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SubAdminController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', [AuthController::class, 'authenticate']);
Route::post('register', [AuthController::class, 'register']);

Route::group(['middleware' => 'auth.role:student'], function () {
    Route::post('create', [PostController::class, 'store']);
});
Route::group(['middleware' => 'auth.role:admin'], function () {
    Route::get('list-posts', [AdminController::class, 'index']);
    Route::get('list-members', [AdminController::class, 'memberList']);
    Route::get('member-detail/{id}', [AdminController::class, 'memberDetail']);
    Route::get('student-list', [AdminController::class, 'studentList']);
    Route::get('teacher-list', [AdminController::class, 'teacherList']);
    Route::post('update-member/{id}',  [AdminController::class, 'update']);
    Route::post('post-approval/{id}',  [AdminController::class, 'postApproval']);
    Route::post('add-member', [AdminController::class, 'addMember']);
});
Route::group(['middleware' => 'auth.role:teacher'], function () {
    Route::post('teacher-post-approval/{id}',  [SubAdminController::class, 'postApproval']);
});
