<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
</head>
<body>
    <h1>Admin Registration</h1>
    
    @if(session('success'))
        <div style="color: green; padding: 10px; border: 1px solid green; margin: 10px 0;">
            {{ session('success') }}
        </div>
    @endif
    
    @if(session('error'))
        <div style="color: red; padding: 10px; border: 1px solid red; margin: 10px 0;">
            {{ session('error') }}
        </div>
    @endif
    
    @if($errors->any())
        <div style="color: red; padding: 10px; border: 1px solid red; margin: 10px 0;">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    
    <form method="POST" action="{{ route('admin.register.submit') }}">
        @csrf
        <div style="margin: 10px 0;">
            <label>Name:</label><br>
            <input type="text" name="name" required style="width: 300px; padding: 5px;">
        </div>
        
        <div style="margin: 10px 0;">
            <label>Email:</label><br>
            <input type="email" name="email" required style="width: 300px; padding: 5px;">
        </div>
        
        <div style="margin: 10px 0;">
            <label>Password:</label><br>
            <input type="password" name="password" required style="width: 300px; padding: 5px;">
        </div>
        
        <div style="margin: 10px 0;">
            <label>Confirm Password:</label><br>
            <input type="password" name="password_confirmation" required style="width: 300px; padding: 5px;">
        </div>
        
        <div style="margin: 10px 0;">
            <button type="submit" style="padding: 10px 20px; background: #007bff; color: white; border: none; cursor: pointer;">
                Register Admin
            </button>
        </div>
    </form>
    
    <hr style="margin: 20px 0;">
    
    <h2>Danger Zone</h2>
    <p style="color: #666; font-size: 14px;">
        <strong>Note:</strong> Registration automatically encrypts email and name fields. The Admin model handles encryption/decryption automatically.
    </p>
    <form method="POST" action="{{ route('admin.delete.all') }}" onsubmit="return confirm('Are you sure you want to delete ALL admin users and reset the table IDs? This cannot be undone!');">
        @csrf
        @method('DELETE')
        <button type="submit" style="padding: 10px 20px; background: #dc3545; color: white; border: none; cursor: pointer;">
            Clear All Admins (Reset IDs)
        </button>
    </form>
    
    <hr style="margin: 20px 0;">
    
    <h2>Existing Admins</h2>
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Active</th>
            <th>Verified</th>
        </tr>
        @forelse($admins as $admin)
        <tr>
            <td>{{ $admin['id'] }}</td>
            <td>{{ $admin['name'] }}</td>
            <td>{{ $admin['email'] }}</td>
            <td>{{ $admin['is_active'] ? 'Yes' : 'No' }}</td>
            <td>{{ $admin['verified'] ? 'Yes' : 'No' }}</td>
        </tr>
        @empty
        <tr>
            <td colspan="5" style="text-align: center; padding: 20px;">No admin users found.</td>
        </tr>
        @endforelse
    </table>
    
    <hr style="margin: 20px 0;">
    
    <a href="{{ route('admin.login') }}" style="padding: 10px 20px; background: #28a745; color: white; text-decoration: none; display: inline-block;">
        Go to Login Page
    </a>
</body>
</html>
