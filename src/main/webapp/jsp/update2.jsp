<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<html>
<head>
<title>update2</title>
</head><body>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un ="root", pa ="Silicium";
      try{Connection con = DriverManager.getConnection(url,un,pa);
          String id    =request.getParameter("id"   ),
                 name  =request.getParameter("name" ),
                 phone =request.getParameter("phone"),
                 mail  =request.getParameter("mail" ),
                 psw   =request.getParameter("psw"  ),
                 sql_update ="update teacher set name='"+name+"',phone='"+phone+"',mail='"+mail+"',psw='"+psw+"'" +
                             "where id='"+id+"'";
          PreparedStatement pst = con.prepareStatement(sql_update);
          int rs = pst.executeUpdate();
          if (rs != 0) {%><script>alert("修改完毕");window.history.back();</script><%}
         }catch (Exception e)         {throw new RuntimeException(e);}
     }catch (ClassNotFoundException e){throw new RuntimeException(e);}
%>
</body></html>
