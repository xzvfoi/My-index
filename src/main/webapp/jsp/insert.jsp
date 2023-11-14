<%@ page contentType="text/html;charset=UTF-8" import="java.util.Objects,java.sql.*"%>
<html>
<head><title>ifs</title></head>
<body>
<%try {Class.forName("com.mysql.cj.jdbc.Driver");
       String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC", un = "root", pa = "Silicium";
       Connection conn;
       int Ser = Integer.parseInt(request.getParameter("type"));
       if (Ser == 1)
       {try {String b =request.getParameter("use1"  ), c =request.getParameter("name1"),
                    d =request.getParameter("class1"), n =request.getParameter("spec1"),
                    f =request.getParameter("psw1");
                    if (Objects.equals(b, "") || Objects.equals(c, "") || Objects.equals(d, "") || Objects.equals(n, "") || Objects.equals(f, ""))
                   {%><script>alert("注册失败 请重新填写");window.history.back();</script><%return;}
                    conn =DriverManager.getConnection(url, un, pa);

                    String sql ="insert into student(id,name,ClassID,specialized,psw)"+
                                "values('"+b+"','"+c+ "','"+d+"','"+n+"','"+f+"')";

                    PreparedStatement pst  =conn.prepareStatement(sql);
                    int rs =pst.executeUpdate();
                    if (rs != 0) {%><script>alert("学生账号添加成功~");window.history.back();</script><%return;}
            }catch (SQLException e)       {throw new RuntimeException(e);}}

       else if (Ser == 2)
       {try {String g =request.getParameter("use2"  ), h =request.getParameter("name2"),
                    i =request.getParameter("phone2"), j =request.getParameter("mail2"),
                    k =request.getParameter("psw2");
                    if (Objects.equals(g, "") || Objects.equals(h, "") || Objects.equals(i, "") || Objects.equals(j, "") || Objects.equals(k, ""))
                    {%><script>alert("注册失败 请重新填写");window.history.back();</script><%return;}

                    conn =DriverManager.getConnection(url, un, pa);
                    String sql ="insert into teacher(id,name,phone,mail,psw)values('"+g+"','"+h+"','"+i+"','"+j+"','"+k+"')";
                    PreparedStatement pst =conn.prepareStatement(sql);
                    int rs =pst.executeUpdate();
                    if (rs != 0) {%><script>alert("教师账号添加成功~");window.history.back();</script><%return;}
            }catch (SQLException e)      {throw new RuntimeException(e);}}
} catch (ClassNotFoundException e)       {throw new RuntimeException(e);}
%>
</body>
</html>
