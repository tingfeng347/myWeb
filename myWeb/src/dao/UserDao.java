package dao;

import bean.User;
import util.jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {


  public Boolean addUser(User user){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;

        try{
            //1.创建链接：
            conn= jdbcUtil.getConn();
            String sql="insert into user_info(name,password) VALUES(?,?);";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());

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

      public Boolean deleteUser(User user){
          //1.创建链接：
          Connection conn=null;
          PreparedStatement pstmt=null;
          try{
              //1.创建链接：
              conn=jdbcUtil.getConn();
              String sql="delete from user_info where name= ?";
              pstmt=conn.prepareStatement(sql);
              pstmt.setString(1,user.getName());
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

    public Boolean updateUser(User user){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="update user_info set name=?,password =? where name=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getName());
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


    public int checkIfHaveUser(User user){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;

        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="select * from user_info where name=? ";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
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

    public int checkUserPswd(User user){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="select * from user_info where name=? and password=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());
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
    public List<User> findAll() throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        List<User> users = new ArrayList<User>();
        con = jdbcUtil.getConn();
        prepStmt = con.prepareStatement("select * from user_info");
        rs = prepStmt.executeQuery();
        while (rs.next()) {
            User user = new User();
            user.setName(rs.getString(1));
            user.setPassword(rs.getString(2));
            users.add(user);
        }
        jdbcUtil.free(rs, prepStmt,con);
        return users;
    }
    public User findUser(User user) throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        User user1 = null;
        try {
            con = jdbcUtil.getConn();
            prepStmt = con.prepareStatement("select * from user_info where name= ? ");
            prepStmt.setString(1, user.getName());
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                user1 = new User();
                user1.setName(rs.getString(1));
                user1.setPassword(rs.getString(2));
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            jdbcUtil.free(rs, prepStmt,con);
        }
        return user1;
    }


}
