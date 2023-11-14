<%--suppress HtmlUnknownAttribute --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<link rel="stylesheet" href="../css/2.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教务管理系统</title>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC",un = "root", pa = "Silicium";
      int Use = Integer.parseInt(request.getParameter("use"));
      String ClassID = request.getParameter("ClassID");
%>
<%!String blanknull(String s) {return (s == null) ? "" : s;}%>
<script>
    function btn1(){
        document.getElementById('show1'  ).style.display ='block';
        document.getElementById('student').style.display ='none' ;
        document.getElementById('notice' ).style.display ='none' ;
        document.getElementById('Use'    ).style.display ='none' ;
        document.getElementById('grades' ).style.display ='none' ;
    }function btn2(){
        document.getElementById('show1'  ).style.display ='none' ;
        document.getElementById('student').style.display ='block';
        document.getElementById('notice' ).style.display ='none' ;
        document.getElementById('Use'    ).style.display ='none' ;
        document.getElementById('grades' ).style.display ='none' ;
    }function btn3(){
        document.getElementById('show1'  ).style.display ='none' ;
        document.getElementById('student').style.display ='none' ;
        document.getElementById('notice' ).style.display ='block';
        document.getElementById('Use'    ).style.display ='none' ;
        document.getElementById('grades' ).style.display ='none' ;
    }function btn4(){
        document.getElementById('show1'  ).style.display ='none' ;
        document.getElementById('student').style.display ='none' ;
        document.getElementById('notice' ).style.display ='none' ;
        document.getElementById('Use'    ).style.display ='block';
        document.getElementById('grades' ).style.display ='none' ;
    }function btn5(){
        document.getElementById('show1'  ).style.display ='none' ;
        document.getElementById('student').style.display ='none' ;
        document.getElementById('notice' ).style.display ='none' ;
        document.getElementById('Use'    ).style.display ='none' ;
        document.getElementById('grades' ).style.display ='block';
    }function btn6(){
        document.getElementById('insert' ).style.display ='block';
        document.getElementById("shadow").style.display  ="block";
    }function btn7(){
        document.getElementById('insert' ).style.display ='none' ;
        document.getElementById("shadow" ).style.display ="none" ;
    }function btn8(){
        document.getElementById('news'  ).style.display ='block' ;
        document.getElementById("shadow").style.display ="block" ;
    }function btn9(){
        document.getElementById('news'  ).style.display ='none' ;
        document.getElementById("shadow").style.display ="none" ;
    }



    if (window.name !== "encyclical") {location.reload();window.name = "encyclical";} else {window.name = "";}

    function displayWindow(){
        document.getElementById('window').style.display = "block";
        document.getElementById('shadow').style.display = "block";
    }
    function hideWindow(){
        document.getElementById('window').style.display = "none" ;
        document.getElementById('shadow').style.display = "none" ;
    }
</script>
</head>
<body>

<div class="header">
    <h2>教务管理系统</h2>
</div>

<div class="topnav">
    <a href="#" onclick="btn1()">课表</a><a href="#" onclick="btn2()">学生</a>
    <a href="#" onclick="btn5()">成绩</a><a href="#" onclick="btn3()">公告</a>
    <a href="#" onclick="btn4()" style="float:right">教师<%out.println(Use);%></a>
</div>

<div class="row">

    <div id="show1">

        <table class="tab1">
        <caption style="font-size: 30px"><%=blanknull(ClassID)%></caption>
        <tr><th></th>
        <th>一</th><th>二</th><th>三</th><th>四</th>
        <th>五</th><th>六</th><th>七</th><th>八</th>
        </tr>
        <%try{Connection con = DriverManager.getConnection(url, un, pa);
              Statement st = con.createStatement();
              String sql = "select * from class where ClassID = '"+ClassID+"'";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {%>
              <form method="post" action=""><label>
              <tr>
              <td><textarea class="textarea1" name="test" readonly><%=rs.getString("test")%></textarea></td>
              <td><textarea class="textarea1" name="date1"><%=rs.getString("date1")%></textarea></td>
              <td><textarea class="textarea1" name="date2"><%=rs.getString("date2")%></textarea></td>
              <td><textarea class="textarea1" name="date3"><%=rs.getString("date3")%></textarea></td>
              <td><textarea class="textarea1" name="date4"><%=rs.getString("date4")%></textarea></td>
              <td><textarea class="textarea1" name="date5"><%=rs.getString("date5")%></textarea></td>
              <td><textarea class="textarea1" name="date6"><%=rs.getString("date6")%></textarea></td>
              <td><textarea class="textarea1" name="date7"><%=rs.getString("date7")%></textarea></td>
              <td><textarea class="textarea1" name="date8"><%=rs.getString("date8")%></textarea></td>
                  <textarea class="textarea1" name="ClassID" style="display: none"><%=rs.getString("ClassID")%></textarea>
              <td><input type="submit" value="修改" onclick="form.action='update3.jsp';form.submit();">&nbsp;&nbsp;</td>
              </tr>
              </label></form>
            <%}} catch (SQLException e) {throw new RuntimeException(e);}%>

        </table>

        <div class="topnav">
        <ul><li>
        <a>选择课表</a>
        <%try{Connection con = DriverManager.getConnection(url, un, pa);
              Statement st = con.createStatement();
              String sql = "select distinct ClassID from class";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {%>
              <form method="post" action="">
              <ul><li>
              <input type="hidden" value="<%=Use%>" name="use">
              <input type="submit" value="<%=rs.getString("ClassID")%>"
              onclick="form.action='hellos.jsp';form.submit()" name="ClassID" style="width: 96px">
              </li></ul>
              <%}}catch (SQLException e) {throw new RuntimeException(e);}%>
              </form>
        </li><a herf="#" onclick="displayWindow()">创建课表</a></ul>
        </div>

        <div id="window" class="window_css">

        <table class="tab1"><form method="post" action=""><label>
            <tr><th></th>
                <th>一</th><th>二</th>
                <th>三</th><th>四</th>
                <th>五</th><th>六</th>
                <th>七</th><th>八</th>
            </tr>
        <caption><textarea placeholder="输入课表名称" name="ClassID" style="font-size: 25px;height: 30px"></textarea></caption>
            <tr>
                <td><textarea class="textarea1" name="testA" readonly>星期一</textarea></td>
                <td><textarea class="textarea1" name="dateA1" ></textarea></td><td><textarea class="textarea1" name="dateA2" ></textarea></td>
                <td><textarea class="textarea1" name="dateA3" ></textarea></td><td><textarea class="textarea1" name="dateA4" ></textarea></td>
                <td><textarea class="textarea1" name="dateA5" ></textarea></td><td><textarea class="textarea1" name="dateA6" ></textarea></td>
                <td><textarea class="textarea1" name="dateA7" ></textarea></td><td><textarea class="textarea1" name="dateA8" ></textarea></td>
            </tr>
            <tr>
                <td><textarea class="textarea1" name="testB" readonly>星期二</textarea></td>
                <td><textarea class="textarea1" name="dateB1" ></textarea></td><td><textarea class="textarea1" name="dateB2" ></textarea></td>
                <td><textarea class="textarea1" name="dateB3" ></textarea></td><td><textarea class="textarea1" name="dateB4" ></textarea></td>
                <td><textarea class="textarea1" name="dateB5" ></textarea></td><td><textarea class="textarea1" name="dateB6" ></textarea></td>
                <td><textarea class="textarea1" name="dateB7" ></textarea></td><td><textarea class="textarea1" name="dateB8" ></textarea></td>
            </tr>
            <tr>
                <td><textarea class="textarea1" name="testC" readonly>星期三</textarea></td>
                <td><textarea class="textarea1" name="dateC1" ></textarea></td><td><textarea class="textarea1" name="dateC2" ></textarea></td>
                <td><textarea class="textarea1" name="dateC3" ></textarea></td><td><textarea class="textarea1" name="dateC4" ></textarea></td>
                <td><textarea class="textarea1" name="dateC5" ></textarea></td><td><textarea class="textarea1" name="dateC6" ></textarea></td>
                <td><textarea class="textarea1" name="dateC7" ></textarea></td><td><textarea class="textarea1" name="dateC8" ></textarea></td>
            </tr>
            <tr>
                <td><textarea class="textarea1" name="testD" readonly>星期四</textarea></td>
                <td><textarea class="textarea1" name="dateD1" ></textarea></td><td><textarea class="textarea1" name="dateD2" ></textarea></td>
                <td><textarea class="textarea1" name="dateD3" ></textarea></td><td><textarea class="textarea1" name="dateD4" ></textarea></td>
                <td><textarea class="textarea1" name="dateD5" ></textarea></td><td><textarea class="textarea1" name="dateD6" ></textarea></td>
                <td><textarea class="textarea1" name="dateD7" ></textarea></td><td><textarea class="textarea1" name="dateD8" ></textarea></td>
            </tr>
            <tr>
                <td><textarea class="textarea1" name="testE" readonly>星期五</textarea></td>
                <td><textarea class="textarea1" name="dateE1" ></textarea></td><td><textarea class="textarea1" name="dateE2" ></textarea></td>
                <td><textarea class="textarea1" name="dateE3" ></textarea></td><td><textarea class="textarea1" name="dateE4" ></textarea></td>
                <td><textarea class="textarea1" name="dateE5" ></textarea></td><td><textarea class="textarea1" name="dateE6" ></textarea></td>
                <td><textarea class="textarea1" name="dateE7" ></textarea></td><td><textarea class="textarea1" name="dateE8" ></textarea></td>
            </tr>
            <tr>
                <td><textarea class="textarea1" name="testF" readonly>星期六</textarea></td>
                <td><textarea class="textarea1" name="dateF1" ></textarea></td><td><textarea class="textarea1" name="dateF2" ></textarea></td>
                <td><textarea class="textarea1" name="dateF3" ></textarea></td><td><textarea class="textarea1" name="dateF4" ></textarea></td>
                <td><textarea class="textarea1" name="dateF5" ></textarea></td><td><textarea class="textarea1" name="dateF6" ></textarea></td>
                <td><textarea class="textarea1" name="dateF7" ></textarea></td><td><textarea class="textarea1" name="dateF8" ></textarea></td>
            </tr>
            <tr>
                <td><textarea class="textarea1" name="testG" readonly>星期日</textarea></td>
                <td><textarea class="textarea1" name="dateG1" ></textarea></td><td><textarea class="textarea1" name="dateG2" ></textarea></td>
                <td><textarea class="textarea1" name="dateG3" ></textarea></td><td><textarea class="textarea1" name="dateG4" ></textarea></td>
                <td><textarea class="textarea1" name="dateG5" ></textarea></td><td><textarea class="textarea1" name="dateG6" ></textarea></td>
                <td><textarea class="textarea1" name="dateG7" ></textarea></td><td><textarea class="textarea1" name="dateG8" ></textarea></td>
            </tr>
        <td><input type="submit" value="创建" onclick="form.action='Classupdate.jsp';form.submit();" style="width: 100px;height: 100px"></td>

        </label></form></table>

        <div class="topnav"><a href="#" onclick="hideWindow()">关闭</a></div>

    </div>

</div>

    <div id="student">
        <h1>学生列表</h1>
        <label>
        <table id="tab2">
        <tr>
        <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">学号</td>
        <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">名字</td>
        <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">班级</td>
        <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">专业</td>
        <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">密码</td>
        </tr>
        <%try{Connection con = DriverManager.getConnection(url, un, pa);
              Statement st = con.createStatement();
              String sql = "select * from student";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {%>
        <tr>
        <form method="post" action="">
        <label>
        <td><textarea type="text" name="ids"        ><%=rs.getInt   ("id")         %></textarea></td>
        <td><textarea type="text" name="name"       ><%=rs.getString("name")       %></textarea></td>
        <td><textarea type="text" name="ClassID"    ><%=rs.getString("ClassID")    %></textarea></td>
        <td><textarea type="text" name="specialized"><%=rs.getString("specialized")%></textarea></td>
        <td><textarea type="text" name="psw"        ><%=rs.getString("psw")        %></textarea></td>
        <td><input type="submit"  value="修改" onclick="form.action='update.jsp';form.submit();" style="height: 35px"></td>
        <td><button style="height: 35px"><a href="delete.jsp?id=<%=rs.getString("id")%>" style="text-decoration: none; color:black;">删除</a></button></td>
        </label>
        </form>
        </tr>
        <%}} catch (SQLException e) {throw new RuntimeException(e);}%>
        </table></label>
        <button><a href="../enroll.jsp">添加学生</a></button>
    </div>

    <div id="grades">

    <h1>成绩列表</h1>
    <label><table id="tab3">
    <tr>
    <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">学号</td>
    <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">课程号</td>
    <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">课程</td>
    <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">成绩</td>
    <td style="background:linear-gradient(to right, #eeeeee, #ffffff);">班级</td>
    </tr>
    <%try{Connection con =DriverManager.getConnection(url, un, pa);
          Statement st =con.createStatement();
          String sql   ="select * from grades;";
          ResultSet rs =st.executeQuery(sql);
          while (rs.next()) {%>
          <tr>
          <form method="post" action="">
          <label>
           <td><textarea name="id"     ><%=rs.getInt   ("id")     %></textarea></td>
           <td><textarea name="grades1"><%=rs.getString("grades1")%></textarea></td>
           <td><textarea name="grades2"><%=rs.getString("grades2")%></textarea></td>
           <td><textarea name="grades3"><%=rs.getString("grades3")%></textarea></td>
           <td><textarea name="grades3"><%=rs.getString("grades4")%></textarea></td>
           <td><input type="submit" value="删除" onclick="form.action='delete1.jsp';form.submit();" style="height: 35px"></td>
           <td><input type="submit" value="修改" onclick="form.action='update4.jsp';form.submit();" style="height: 35px"></td>
           </label></form>
          <%}} catch (SQLException e) {throw new RuntimeException(e);}%>
          </tr>
    </table></label>
        <input type="submit"  value="添加成绩" onclick="btn6()" style="height: 35px">
    </div>

    <div id="insert" class="window_css">
    <form method="post" action="">
    <label>
        <td><textarea name="id"      placeholder="id"   ></textarea></td>
        <td><textarea name="grades1" placeholder="课程号"></textarea></td>
        <td><textarea name="grades2" placeholder="课程"  ></textarea></td>
        <td><textarea name="grades3" placeholder="成绩"  ></textarea></td>
        <td><textarea name="grades4" placeholder="班级"  ></textarea></td>
        <a herf="#" onclick="btn7()">关闭</a>
        <input type="submit" value="添加" onclick="form.action='insert2.jsp';form.submit();">
    </label>
    </form>
    </div>


    <div id="notice">
        <div class="topnav"><a onclick="btn8()">发布公告</a></div>
        <%try{Connection con =DriverManager.getConnection(url, un, pa);
        Statement st =con.createStatement();
        String    sql="select * from news";
        ResultSet rs =st.executeQuery(sql);
        while (rs.next()) {%>
        <label>
        <form method="post" action="">
        <div class="card"><textarea name="zero" style="display: none"><%=rs.getString("zero")%></textarea>
        <p><textarea class="textarea2" name="one"><%=rs.getString("one")%></textarea></p>
        <p><textarea class="textarea2" name="two"><%=rs.getString("two")%></textarea></p>
        <div class="fakeimg" style="height:150px;">
            <textarea class="textarea2" style="background-color: #aaaaaa" name="three"><%=rs.getString("three")%></textarea>
        </div>
        <p><textarea  class="textarea2" name="four"><%=rs.getString("four")%></textarea></p>
        <p><textarea  class="textarea2" name="five"><%=rs.getString("five")%></textarea></p>
        <input type="submit" value="修改" onclick="form.action='update5.jsp';form.submit();">
        <input type="submit" value="删除" onclick="form.action='delete2.jsp';form.submit();">
        </div>
        </form>
        </label>
        <%}}catch(SQLException e)          {throw new RuntimeException(e);}%>
    </div>

    <div id="news" class="window_css1">
        <label>
        <form method="post" action="">
        <div class="textarea2" >
        <h1><textarea class="textarea2" name="one" placeholder="主标题"></textarea></h1>
        <h5><textarea class="textarea2" name="two" placeholder="副标题"></textarea></h5>
        <div class="fakeimg" style="height:150px;">
            <textarea  class="textarea2" style="background-color: #aaaaaa" name="three" placeholder="正文1"></textarea>
        </div>
        <p><textarea  class="textarea2" name="four" placeholder="正文二"></textarea></p>
        <p><textarea  class="textarea2" name="five" placeholder="正文三"></textarea></p>
        <input type="submit" value="发布" onclick="form.action='insert3.jsp';form.submit();">
        <div class="topnav"><a onclick="btn9()">关闭窗口</a></div>
        </div>
        </form>
        </label>
    </div>

    <div id="Use" style="text-align: center">

        <h1> 帐户信息</h1>
        <%try{Connection con =DriverManager.getConnection(url, un, pa);
              Statement st =con.createStatement();
              String    sql="select * from teacher where id='"+Use+"'";
              ResultSet rs =st.executeQuery(sql);
              while (rs.next()) {%>
              <form method="post" action=""><label>
              账户<input type="text" value="<%=rs.getInt   ("id")   %>" style="width:auto" name="id"   ><br>
              名称<input type="text" value="<%=rs.getString("name") %>" style="width:auto" name="name" ><br>
              电话<input type="text" value="<%=rs.getString("phone")%>" style="width:auto" name="phone"><br>
              邮箱<input type="text" value="<%=rs.getString("mail") %>" style="width:auto" name="mail" ><br>
              密码<input type="text" value="<%=rs.getString("psw")  %>" style="width:auto" name="psw"  ><br>
              <input type="submit" value="修改" style="width: 95.5px"
                     onclick="form.action='update2.jsp';form.submit();">&nbsp;
              <input type="button" value="退出登录" style="width: 95.5px"
                     onclick="<%session.invalidate();%>window.location.href='../index.jsp';alert('已退出登录');">
              </label></form>
              <%}}catch(SQLException e)          {throw new RuntimeException(e);}
                } catch(ClassNotFoundException e){throw new RuntimeException(e);}
              %>

    </div>

</div>

<div class="footer">
    <h2>Version 0.2</h2>
</div>

<div id="shadow" class="shadow_css"></div>

</body>
</html>