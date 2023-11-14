<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%try {Class.forName("com.mysql.cj.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un = "root", pa = "Silicium";
  try{Connection conn =DriverManager.getConnection(url, un, pa);
      String  one   =request.getParameter("one"  ) ,two  =request.getParameter("two" ),
            three =request.getParameter("three"),four =request.getParameter("four"),
            five  =request.getParameter("five" ) ,
            sql   ="insert into news(one,two,three,four,five)"+
                   "values('"+one+"','"+two+ "','"+three+"','"+four+"','"+five+"')";
      PreparedStatement pst  =conn.prepareStatement(sql);
      int rs =pst.executeUpdate();
      if (rs != 0) {%><script>alert("公告发布完毕");window.history.back();</script><%return;}
}catch (SQLException e)        {throw new RuntimeException(e);}
}catch (ClassNotFoundException e)       {throw new RuntimeException(e);}
%>
</body>
</html>
