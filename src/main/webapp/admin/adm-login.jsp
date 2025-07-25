<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Athul V Kumar - Admin Login</title>
</head>
<body>
    <div class="bg-gradient-circle circle1"></div>
    <div class="bg-gradient-circle circle2"></div>
    <div class="login-container">
        <div class="login-card">
            <h2 class="login-title">Login</h2>
            <form method="post" action="login" class="login-form">
                <div class="input-group">
                    <label for="username"><span class="login-icon">&#128100;</span> Username</label>
                    <input type="text" id="username" name="username" required placeholder="Enter your username">
                </div>
                <div class="input-group">
                    <label for="password"><span class="login-icon">&#128274;</span> Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>
                <button type="submit" class="login-btn">Login</button>
            </form>
        </div>
    </div>
</body>
</html>