<%@ page import="java.sql.*" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>if</title></head>
<body>
<%
try {Class.forName("com.mysql.cj.jdbc.Driver");
     String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un ="root", pa ="Silicium",
              a = request.getParameter("use"),b=request.getParameter("psw");
     int Ser = Integer.parseInt(request.getParameter("type"));


    if (Ser == 1)
     {try{if(Objects.equals(a,"") || Objects.equals(b,"")){%><script>alert("登录失败 请重新登录");window.location.href = '../index.jsp';</script><%return;}
          int Use = Integer.parseInt(a), Psw = Integer.parseInt(b);
          Connection con = DriverManager.getConnection(url, un, pa);
          Statement st = con.createStatement();
          String sql = "select count(*) from student where id='"+Use+"' and psw='"+Psw+"'";
         ResultSet rs = st.executeQuery(sql);
          int count = -1;
          if (rs.next()) {count = rs.getInt(1);}
          if (count > 0)
          {request.getRequestDispatcher("hello.jsp").forward(request, response);}
          else{%><script>alert("账户或密码错误/未注册，请重新输入");window.location.href = '../index.jsp';</script><%}

     }catch (SQLException e) {throw new RuntimeException(e);}}

     else if (Ser == 2)
    {try {if(Objects.equals(a,"") || Objects.equals(b,"")){%><script>alert("登录失败 请重新登录");window.location.href = '../index.jsp';</script><%return;}
          int Use = Integer.parseInt(a), Psw = Integer.parseInt(b);
          Connection con = DriverManager.getConnection(url, un, pa);
          Statement st = con.createStatement();
          String sql = "select count(*) from teacher where id='"+Use+"' and psw='"+Psw+"'";
          ResultSet rs = st.executeQuery(sql);
          int count = -1;

          if (rs.next()) {count = rs.getInt(1);}
          if (count > 0) {request.getRequestDispatcher("hellos.jsp").forward(request, response);}
          else {%><script>alert("账户或密码错误/未注册，请重新输入");window.location.href = '../index.jsp';</script><%}
        }catch (SQLException e) {throw new RuntimeException(e);}}

    } catch (ClassNotFoundException e) {throw new RuntimeException(e);}
%>
</body>
</html>
