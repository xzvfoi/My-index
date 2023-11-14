<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
      String url ="jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un ="root", pa= "Silicium";
      try{Connection con =DriverManager.getConnection(url,un,pa);
          String      id =request.getParameter("id"),grades1 =request.getParameter("grades1"),
                 grades2 =request.getParameter("grades2"),grades3 =request.getParameter("grades3"),
              sql_update ="update grades set grades2='"+grades2+"',grades3='"+grades3+"' where id='"+id+"'and grades1='"+grades1+"'";
          PreparedStatement pst = con.prepareStatement(sql_update);
          int rs = pst.executeUpdate();
          if (rs != 0) {%><script>alert("修改完毕");window.history.back();</script><%}
    }catch (Exception e)        {throw new RuntimeException(e);}
}catch (ClassNotFoundException e){throw new RuntimeException(e);}
%>
</html>
