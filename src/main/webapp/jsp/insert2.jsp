<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%try {Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un = "root", pa = "Silicium";
        try{Connection conn =DriverManager.getConnection(url, un, pa);
            String id =request.getParameter("id"  ), grades1 =request.getParameter("grades1"),
                    grades2 =request.getParameter("grades2"), grades3 =request.getParameter("grades3"),
                    grades4 =request.getParameter("grades4");
            String sql ="insert into grades(id,grades1,grades2,grades3,grades4)"+
            "values('"+id+"','"+grades1+ "','"+grades2+"','"+grades3+"','"+grades4+"')";
            PreparedStatement pst  =conn.prepareStatement(sql);
            int rs =pst.executeUpdate();
            if (rs != 0) {%><script>alert("学生成绩添加完毕");window.history.back();</script><%return;}
           }catch (SQLException e)        {throw new RuntimeException(e);}
  }catch (ClassNotFoundException e)       {throw new RuntimeException(e);}
%>
</body>
</html>
