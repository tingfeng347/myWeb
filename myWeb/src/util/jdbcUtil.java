package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class jdbcUtil {

    public static Connection getConn()throws Exception{
        String driverName = "com.mysql.jdbc.Driver";          //驱动程序名
        String userName = "root";                             //数据库用户名
        String userPwd = "123456";                             //密码
        String dbName = "mytestdb";                       //数据库名
        String  url1="jdbc:mysql://localhost:3306/"+dbName;
        String url2 ="?user="+userName+"&password="+userPwd;
        String  url3="&useUnicode=true&characterEncoding=UTF-8";  //访问数据库的汉字编码
        String url =url1+url2+url3;                                //形成带数据库读写编码的数据库连接字
        Class.forName(driverName);                                 //加载并注册驱动程序
        Connection conn= DriverManager.getConnection(url);          //创建连接对象
        return conn;
    }

    public static void free(ResultSet rs, PreparedStatement pstmt,Connection conn)throws Exception{
        if(rs!=null) rs.close();
        if(pstmt!=null) pstmt.close();
        if(conn!=null) conn.close();

    }
}
