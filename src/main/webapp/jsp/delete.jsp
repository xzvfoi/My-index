<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" %>
<html>
<head><title>数据删除</title></head>
<body>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un = "root", pa = "Silicium";
      try{Connection con = DriverManager.getConnection(url, un, pa);
          String id  =request.getParameter("id"),
          sql_delete ="delete student,grades from student left join grades ON student.id =grades.id where student.id='"+id+"'";
          PreparedStatement pst =con.prepareStatement(sql_delete);
          int rs =pst.executeUpdate();
          if (rs != 0) {%><script>alert("删除成功");window.history.back();</script><%}
        }catch (Exception e)         {throw new RuntimeException(e);}
    }catch (ClassNotFoundException e){throw new RuntimeException(e);}
%></body>
</html>

