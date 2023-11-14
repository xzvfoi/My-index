<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="css/1.css" type="text/css">

<html>
<head><title>账户添加</title>
    <script>
        function handoff(page, tag){
        let i = 1,el;
        while (el = document.getElementById(tag + i))
        {if (i === page) el.style.display='block';else el.style.display='none';i++;}
        }function btn0(){window.history.back();}
    </script>
</head>
<body>

<div class="a">

    <a>账户添加</a>
    <br><br><br>
    <form action="jsp/insert.jsp">
        <label>
        <select onchange="handoff(parseInt(this.value), 'handoff');" style="width: 100px" name="type">
        <option value="1">学生</option><option value="2" selected="selected">教师</option>
        </select>
        </label><br><br><br>

        <div style="display:none" id="handoff1">
        <label>
        <input name="use1"   placeholder="账户"><br>
        <input name="psw1"   placeholder="密码" type="password"><br>
        <input name="spec1"  placeholder="专业"><br>
        <input name="name1"  placeholder="名字"><br>
        <input name="class1" placeholder="班级"><br>
        <input type="submit"   name="conf1" value="注册" style="width: 100px"><br>
        <input type="button" style="width: 100px" value="返回" onclick="btn0()">
        </label>
        </div>

        <div style="display:block" id="handoff2">
        <label>
        <input type="text"     name="use2"   placeholder="账户"><br>
        <input type="password" name="psw2"   placeholder="密码"><br>
        <input type="text"     name="name2"  placeholder="名字"><br>
        <input type="text"     name="phone2" placeholder="电话"><br>
        <input type="text"     name="mail2"  placeholder="邮箱"><br>
        <input type="submit"   name="conf2" value="注册" style="width: 100px"><br>
        <input type="button" style="width: 100px" value="返回" onclick="btn0()">
        </label>
        </div>
    </form>

</div>

</body>
</html>
