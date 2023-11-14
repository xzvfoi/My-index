<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un = "root", pa = "Silicium";
    try{Connection con = DriverManager.getConnection(url, un, pa);
        String zero =request.getParameter("zero"), sql_delete ="delete from news where zero='"+zero+"'";
        PreparedStatement pst =con.prepareStatement(sql_delete);
        int rs =pst.executeUpdate();
        if (rs != 0) {%><script>alert("删除成功");window.history.back();</script><%}
        }catch (Exception e)         {throw new RuntimeException(e);}
}catch (ClassNotFoundException e){throw new RuntimeException(e);}%>
</body>
</html>
