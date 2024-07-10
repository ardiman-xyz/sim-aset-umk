<?php

namespace App\Http\Controllers;

use App\Dto\User\CreateUserDto;
use App\Dto\User\UpdateUserDto;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Services\UserService;
use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UserController extends Controller
{

    public function __construct(
        protected UserService $userService
    ){}

    public function index()
    {

        $users = $this->userService->getAll();

        return Inertia::render("User/Index", [
            "users" => $users
        ]);
    }

    public function store(StoreUserRequest $request): \Illuminate\Http\JsonResponse
    {
        $data = $request->validated();

        $dto = new CreateUserDto();
        $dto->name = $data['name'];
        $dto->email = $data['email'];
        $dto->password = $data['password'];
        $dto->role = "User";

        try {

            $res = $this->userService->create($dto);

            return response()->json([
                "status" => true,
                "message" => "Data berhasil ditambahkan",
                "data" => $res
            ], 201);

        }catch (Exception $exception){
            return response()->json([
                "status" => false,
                "message" => $exception->getMessage(),
                "data" => null
            ], 400);
        }
    }

    public function update(UpdateUserRequest $request, string $id) 
    {
        $data = $request->validated();

        $dto = new UpdateUserDto();
        $dto->name = $data['name'];
        $dto->email = $data['email'];
        $dto->password = $data['password'];
        $dto->role = "User";

        try {

            $res = $this->userService->update($dto, $id);

            return response()->json([
                "status" => true,
                "message" => "Data berhasil di update",
                "data" => $res
            ]);

        }catch (Exception $exception){
            return response()->json([
                "status" => false,
                "message" => $exception->getMessage(),
                "data" => null
            ], 400);
        }
    }
}
