<%--suppress HtmlUnknownTag --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<link rel="stylesheet" href="../css/2.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
try {Class.forName("com.mysql.cj.jdbc.Driver");
     String url ="jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC",un ="root",pa ="Silicium";
     int Use = Integer.parseInt(request.getParameter("use"));
     String ClassID = request.getParameter("ClassID");
%>
<script>
    function btn1() {
        document.getElementById('show1' ).style.display ='block';
        document.getElementById('show2' ).style.display ='none' ;
        document.getElementById('notice').style.display ='none' ;
        document.getElementById('Use'   ).style.display ='none' ;
    }function btn2() {
        document.getElementById('show1' ).style.display ='none' ;
        document.getElementById('show2' ).style.display ='block';
        document.getElementById('notice').style.display ='none' ;
        document.getElementById('Use'   ).style.display ='none' ;
    }function btn3() {
        document.getElementById('show1' ).style.display ='none' ;
        document.getElementById('show2' ).style.display ='none' ;
        document.getElementById('notice').style.display ='block';
        document.getElementById('Use'   ).style.display ='none' ;
    }function btn4() {
        document.getElementById('show1' ).style.display ='none' ;
        document.getElementById('show2' ).style.display ='none' ;
        document.getElementById('notice').style.display ='none' ;
        document.getElementById('Use'   ).style.display ='block';
    }if (window.name !== "encyclical") {location.reload();window.name = "encyclical";} else {window.name = "";}
</script>
</head>
<body>

<div class="header">
    <h2>教务管理系统</h2>
</div>

<div class="topnav">
    <a href="#" onclick="btn1()">课表</a>
    <a href="#" onclick="btn2()">成绩</a>
    <a href="#" onclick="btn3()">公告</a>
    <a href="#" onclick="btn4()" style="float:right">学生<%out.println(Use);%></a>
</div>

<div class="row">

    <div id="show1">
        <table class="tab1">
        <tr>
        <th></th>
        <th>一</th><th>二</th><th>三</th><th>四</th>
        <th>五</th><th>六</th><th>七</th><th>八</th>
        </tr>
      <%try{Connection con =DriverManager.getConnection(url, un, pa);
            Statement st =con.createStatement();
            String sql ="select * from class where ClassID='"+ClassID+"'";
            ResultSet rs =st.executeQuery(sql);
            while (rs.next()) {%>
            <lable><tr>
            <td style="height: 100px"><%=rs.getString("test" )%></td>
            <td><%=rs.getString("date1")%></td>
            <td><%=rs.getString("date2")%></td>
            <td><%=rs.getString("date3")%></td>
            <td><%=rs.getString("date4")%></td>
            <td><%=rs.getString("date5")%></td>
            <td><%=rs.getString("date6")%></td>
            <td><%=rs.getString("date7")%></td>
            <td><%=rs.getString("date8")%></td>
            </tr></lable>
    <%}} catch (SQLException e) {throw new RuntimeException(e);}%>
        </table>
        <div>
            <%try{Connection con = DriverManager.getConnection(url, un, pa);
            Statement st = con.createStatement();
            String sql = "select * from student where id='"+Use+"'";
            ResultSet rss =st.executeQuery(sql);
            while (rss.next()){%>
            <label><form name="test" method="post" action="hello.jsp">
                <textarea name="use" style="display: none"><%=Use%></textarea>
                <textarea name="ClassID" style="display: none"><%=rss.getString("ClassID")%></textarea>
                <input type="submit" value="获取课表">
            </form></label><%}
            st.executeQuery(sql);
            }catch (SQLException e) {throw new RuntimeException(e);}%>
        </div>
    </div>

    <div id="show2">
        <h1>成绩查询</h1>
        <label><table class="tab1">
        <tr style="background:linear-gradient(to right, #ffffff, #eeeeee);">
        <td>课程</td><td>成绩</td>
        </tr>
        <%try{Connection con = DriverManager.getConnection(url, un, pa);
              Statement st = con.createStatement();
              String sql = "select * from grades where id ='"+Use+"'";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {%>
        <form method="get" action=""><tr style="height: 100px">
        <td><%=rs.getString("grades1")%></td>
        <td><%=rs.getString("grades3")%></td></tr>
        <%}} catch (SQLException e) {throw new RuntimeException(e);}%>
        </form></table></label>
    </div>

    <div id="notice">
        <%try{Connection con =DriverManager.getConnection(url, un, pa);
            Statement st =con.createStatement();
            String    sql="select * from news";
            ResultSet rs =st.executeQuery(sql);
            while (rs.next()) {%>
        <div class="card">
            <p><%=rs.getString("one")%></p>
            <p><%=rs.getString("two")%></p>
            <div class="fakeimg" style="height:150px;"><%=rs.getString("three")%></div>
            <p><%=rs.getString("four")%></p>
            <p><%=rs.getString("five")%></p>
        </div>
        <%}}catch(SQLException e)          {throw new RuntimeException(e);}%>
    </div>
<div>

</div>
    <div id="Use" style="text-align:center">
    <h1> 帐户信息</h1>
    <form action="">
    <%try{Connection con = DriverManager.getConnection(url, un, pa);
          Statement st = con.createStatement();
          String sql = "select * from student where id = '" + Use + "'";
          ResultSet rs = st.executeQuery(sql);
          while (rs.next()) {%>
       <label>
       <input type="text" value="<%=rs.getInt   ("id"         )%>" style="width:auto;display:none" name="ids">
    名字<input type="text" value="<%=rs.getString("name"       )%>" style="width:auto" name="name"       ><br>
    班级<input type="text" value="<%=rs.getString("ClassID"    )%>" style="width:auto" name="ClassID" readonly><br>
    专业<input type="text" value="<%=rs.getString("specialized")%>" style="width:auto" name="specialized" readonly><br>
    密码<input type="text" value="<%=rs.getString("psw")        %>" style="width:auto" name="psw"        ><br>
        <button style="width: 95px" onclick="form.action='update.jsp';form.submit();">修改信息</button>&nbsp;
        <input type="button" value="退出登录" style="width: 95px"
               onclick="<%session.invalidate();%>window.location.href='../index.jsp';alert('已退出登录');">
        </label></form>
    <%}} catch (SQLException e)           {throw new RuntimeException(e);}
       } catch (ClassNotFoundException e) {throw new RuntimeException(e);}
    %>
    </div>

</div>

<div class="footer">
    <h2>Version 0.1</h2>
</div>

</body>
</html>