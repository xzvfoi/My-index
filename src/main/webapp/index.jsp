<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="css/1.css" type="text/css">
<html>
<head>
    <title>登录</title>
</head><body>

<div class="a">

    <a>教务管理系统</a><br>
    <b>welcome to system</b><br><br>
    <form name="form 1" method="post" action="jsp/if.jsp"><label>
    <select style="width: 100px;" name="type" id="server">
    <option value="1">学生</option><option value="2">教师</option>
    </select><br><br><br>
    <input type="text"     name="use" id="Use" placeholder="账户"><br>
    <input type="password" name="psw" id="Psw" placeholder="密码"><br><br><br>
    <input type="submit"   name="con" id="Con" value="登录" style="width: 100px"><br>
    </label></form>
    <br><br><br><br><br><br>
    <b>DateTime</b>
    <div id="DateTime">
        <script>setInterval("document.getElementById('DateTime').innerHTML=new Date().toLocaleDateString()", 1000);</script>
    </div>

</div>

</body></html>
