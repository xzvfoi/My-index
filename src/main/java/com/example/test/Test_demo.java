package com.example.test;
import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test_demo
{

    public static final String driver ="com.mysql.cj.jdbc.Driver";
    public static final String url = "jdbc:mysql://localhost:3306/test?&useSSL=false&serverTimezone=UTC";//数据库名
    public static final String user = "root";//用户名
    public static final String password = "Silicium";//密码
    static String sql = "select * from websites";//SQL选择表名语句
    static PreparedStatement ps = null;
    static Connection conn = null;
    static ResultSet rs = null;


    public static void main(String[] args)
    {
        try
            {
            Class.forName(driver);//指定连接类型
            conn = DriverManager.getConnection(url, user, password);//获取连接
            ps = conn.prepareStatement(sql);//准备执行语句
            }

        catch (ClassNotFoundException e)//检查JDBC是否安装（jar文件）
            {
            System.out.println("数据库驱动没有安装");
            }

        catch (Exception e)//错误打印
            {
            e.printStackTrace();
            }

        try
            {
            rs = ps.executeQuery();//执行查询语句
            if (!conn.isClosed())
                {
                System.out.println("数据库连接成功");
                while (rs.next())
                    {
                    int id = rs.getInt("Id");
                    String name = rs.getString("Name"), url = rs.getString("URL");
                    System.out.println("ID:" + id + "   网站:" + name + "  URL:" + url);
                    }
                rs.close();
                conn.close();
                ps.close();
                }
            }

        catch (SQLException e)//测试模块
            {
            e.printStackTrace();
            System.out.println("数据库连接失败");
            }
}
}


