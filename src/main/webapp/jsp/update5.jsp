<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un ="root", pa ="Silicium";
  try{Connection con =DriverManager.getConnection(url,un,pa);
    String  one  =request.getParameter("one"  ) ,two  =request.getParameter("two" ),
            three =request.getParameter("three"),four =request.getParameter("four"),
            five =request.getParameter("five" ) ,zero =request.getParameter("zero"),
            sql_update ="update news set one='"+one+"',two='"+two+"',three='"+three+"',four='"+four+"',five='"+five+"'" +
                        "where zero='"+zero+"'";
    PreparedStatement pst =con.prepareStatement(sql_update);
    int rs = pst.executeUpdate();
    if (rs != 0) {%><script>alert("修改完毕");window.history.back();</script><%}
}catch (Exception e)         {throw new RuntimeException(e);}
}catch (ClassNotFoundException e){throw new RuntimeException(e);}
%>
</body>
</html>
