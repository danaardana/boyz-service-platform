<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, ...$roles)
    {
        $user = auth('admin')->user();

        if (!$user) {
            abort(403);
        }

        if (!in_array($user->role, $roles)) {
            abort(403, 'Unauthorized access.');
        }

        return $next($request);
    }
}
