package dao;

import bean.Admin;
import util.jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {


   public Boolean addAdmin(Admin admin){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;

        try{
            //1.创建链接：
            conn= jdbcUtil.getConn();
            String sql="insert into admin(name,password) VALUES(?,?);";
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1,admin.getName());
            pstmt.setString(2,admin.getPassword());

            int rs=pstmt.executeUpdate();

            if (rs>0){
               return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }


    }

    public int checkIfHaveAdmin(Admin admin){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;

        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="select * from admin where name=? ";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,admin.getName());
            ResultSet rs=pstmt.executeQuery();
            if (rs.next()){
                return 1;
            }else{
                return 0;
            }
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int checkAdminPswd(Admin admin){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="select * from admin where name=? and password=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,admin.getName());
            pstmt.setString(2,admin.getPassword());
            ResultSet rs=pstmt.executeQuery();
            if (rs.next()){
                return 1;
            }else{
                return 0;
            }
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public List<Admin> findAll() throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        List<Admin> admins = new ArrayList<Admin>();
        con = jdbcUtil.getConn();
        prepStmt = con.prepareStatement("select * from admin");
        rs = prepStmt.executeQuery();
        while (rs.next()) {
            Admin admin = new Admin();
            admin.setName(rs.getString(1));
            admin.setPassword(rs.getString(2));
            admins.add(admin);
        }
        jdbcUtil.free(rs, prepStmt,con);
        return admins;
    }
}
