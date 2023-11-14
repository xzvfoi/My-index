<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<html>
<head>
<title>update3</title>
</head><body>
<%try{Class.forName("com.mysql.cj.jdbc.Driver");
      String url ="jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un ="root", pa= "Silicium";
      try{Connection con =DriverManager.getConnection(url,un,pa);
          String
           test =request.getParameter("test") , ClassID=request.getParameter("ClassID"),
          date1 =request.getParameter("date1"), date2 =request.getParameter("date2"),
          date3 =request.getParameter("date3"), date4 =request.getParameter("date4"),
          date5 =request.getParameter("date5"), date6 =request.getParameter("date6"),
          date7 =request.getParameter("date7"),
          sql_update ="update class set "+
               "date1='"+date1+"',date2='"+date2+"',date3='"+date3+"',date4='"+date4+"',"+
               "date5='"+date5+"',date6='"+date6+"',date7='"+date7+"'"+
               "where ClassID='"+ClassID+"' and test ='"+test+"'";
          PreparedStatement pst = con.prepareStatement(sql_update);
          int rs = pst.executeUpdate();
          if (rs != 0) {%><script>alert("修改完毕");window.history.back();</script><%}
         }catch (Exception e)        {throw new RuntimeException(e);}
    }catch (ClassNotFoundException e){throw new RuntimeException(e);}
%>
</body></html>
