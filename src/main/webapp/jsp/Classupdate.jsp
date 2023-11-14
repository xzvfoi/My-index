<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC",un = "root", pa = "Silicium";
      try{Connection con = DriverManager.getConnection(url, un, pa);
          String  testA =request.getParameter("testA"),
                 dateA1 =request.getParameter("dateA1"), dateA2 =request.getParameter("dateA2"), dateA3 =request.getParameter("dateA3"), dateA4 =request.getParameter("dateA4"),
                 dateA5 =request.getParameter("dateA5"), dateA6 =request.getParameter("dateA6"), dateA7 =request.getParameter("dateA7"), dateA8 =request.getParameter("dateA8"),
                  testB =request.getParameter("testB"),
                 dateB1 =request.getParameter("dateB1"), dateB2 =request.getParameter("dateB2"), dateB3 =request.getParameter("dateB3"), dateB4 =request.getParameter("dateB4"),
                 dateB5 =request.getParameter("dateB5"), dateB6 =request.getParameter("dateB6"), dateB7 =request.getParameter("dateB7"), dateB8 =request.getParameter("dateB8"),
                  testC =request.getParameter("testC"),
                 dateC1 =request.getParameter("dateC1"), dateC2 =request.getParameter("dateC2"), dateC3 =request.getParameter("dateC3"), dateC4 =request.getParameter("dateC4"),
                 dateC5 =request.getParameter("dateC5"), dateC6 =request.getParameter("dateC6"), dateC7 =request.getParameter("dateC7"), dateC8 =request.getParameter("dateC8"),
                  testD =request.getParameter("testD"),
                 dateD1 =request.getParameter("dateD1"), dateD2 =request.getParameter("dateD2"), dateD3 =request.getParameter("dateD3"), dateD4 =request.getParameter("dateD4"),
                 dateD5 =request.getParameter("dateD5"), dateD6 =request.getParameter("dateD6"), dateD7 =request.getParameter("dateD7"), dateD8 =request.getParameter("dateD8"),
                  testE =request.getParameter("testE"),
                 dateE1 =request.getParameter("dateE1"), dateE2 =request.getParameter("dateE2"), dateE3 =request.getParameter("dateE3"), dateE4 =request.getParameter("dateE4"),
                 dateE5 =request.getParameter("dateE5"), dateE6 =request.getParameter("dateE6"), dateE7 =request.getParameter("dateE7"), dateE8 =request.getParameter("dateE8"),
                  testF =request.getParameter("testF"),
                 dateF1 =request.getParameter("dateF1"), dateF2 =request.getParameter("dateF2"), dateF3 =request.getParameter("dateF3"), dateF4 =request.getParameter("dateF4"),
                 dateF5 =request.getParameter("dateF5"), dateF6 =request.getParameter("dateF6"), dateF7 =request.getParameter("dateF7"), dateF8 =request.getParameter("dateF8"),
                  testG =request.getParameter("testG"),
                 dateG1 =request.getParameter("dateG1"), dateG2 =request.getParameter("dateG2"), dateG3 =request.getParameter("dateG3"), dateG4 =request.getParameter("dateG4"),
                 dateG5 =request.getParameter("dateG5"), dateG6 =request.getParameter("dateG6"), dateG7 =request.getParameter("dateG7"), dateG8 =request.getParameter("dateG8"),
                 ClassID =request.getParameter("ClassID"),
                 sql ="insert into class(test,date1,date2,date3,date4,date5,date6,date7,date8,ClassID)" +
                        "values('"+testA+"','"+dateA1+"','"+dateA2+"','"+dateA3+"','"+dateA4+"','"+dateA5+"','"+dateA6+"','"+dateA7+"','"+dateA8+"','"+ClassID+"'),"+
                              "('"+testB+"','"+dateB1+"','"+dateB2+"','"+dateB3+"','"+dateB4+"','"+dateB5+"','"+dateB6+"','"+dateB7+"','"+dateB8+"','"+ClassID+"'),"+
                              "('"+testC+"','"+dateC1+"','"+dateC2+"','"+dateC3+"','"+dateC4+"','"+dateC5+"','"+dateC6+"','"+dateC7+"','"+dateC8+"','"+ClassID+"'),"+
                              "('"+testD+"','"+dateD1+"','"+dateD2+"','"+dateD3+"','"+dateD4+"','"+dateD5+"','"+dateD6+"','"+dateD7+"','"+dateD8+"','"+ClassID+"'),"+
                              "('"+testE+"','"+dateE1+"','"+dateE2+"','"+dateE3+"','"+dateE4+"','"+dateE5+"','"+dateE6+"','"+dateE7+"','"+dateE8+"','"+ClassID+"'),"+
                              "('"+testF+"','"+dateF1+"','"+dateF2+"','"+dateF3+"','"+dateF4+"','"+dateF5+"','"+dateF6+"','"+dateF7+"','"+dateF8+"','"+ClassID+"'),"+
                              "('"+testG+"','"+dateG1+"','"+dateG2+"','"+dateG3+"','"+dateG4+"','"+dateG5+"','"+dateG6+"','"+dateG7+"','"+dateG8+"','"+ClassID+"')";
          PreparedStatement pst  =con.prepareStatement(sql);
        int rs =pst.executeUpdate();
        if (rs != 0) {%><script>alert("课程添加完毕");window.history.back();</script><%return;}
        }catch (SQLException e)           {throw new RuntimeException(e);}
    }catch (ClassNotFoundException e)     {throw new RuntimeException(e);}
%>
</body>
</html>
