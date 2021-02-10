<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginMoodle.aspx.cs" Inherits="moodle_loginMoodle" %>

<!DOCTYPE html>

<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<form id="myform" class="mt-3" action="https://moodle.israa.edu.ps/login/moodle_login.php" method="post" id="login">
    <input id="anchor" type="hidden" name="anchor" value="">
    <script>document.getElementById('anchor').value = location.hash;</script>
    <input type="hidden" name="logintoken" value="3GH6C00emSAopweQb9srdgGIetzBI6QG">
    <div class="form-group">
        <label for="username" class="sr-only">
            اسم المستخدم
        </label>
        <input type="text" runat="server" name="username" id="username" class="form-control" placeholder="اسم المستخدم" autocomplete="username"/>
    </div>
    <div class="form-group">
        <label for="password" class="sr-only">كلمة المرور</label>
        <input type="text" runat="server" name="password" id="password"  class="form-control" placeholder="كلمة المرور" autocomplete="current-password"/>
    </div>
    <div class="rememberpass mt-3">
        <input type="checkbox" name="rememberusername" id="rememberusername" value="1" checked="checked">
        <label for="rememberusername">تذكر اسم المستخدم</label>
    </div>

    <button type="submit" class="btn btn-primary btn-block mt-3" id="loginbtn">دخول</button>
</form>

<script>
    $(function(){
       document.getElementById('myform').submit();
    });
</script>
</body>
</html>