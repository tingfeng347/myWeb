package dao;

import bean.Student;
import util.jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
        public Boolean addStudent(Student student){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;

        try{
            //1.创建链接：
            conn= jdbcUtil.getConn();
            String sql="insert into stu(sno,name,age,sex,height,weight,fhl,tqq) VALUES(?,?,?,?,?,?,?,?);";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,student.getSno());
            pstmt.setString(2,student.getName());
            pstmt.setInt(3,student.getAge());
            pstmt.setString(4,student.getSex());
            pstmt.setDouble(5,student.getHeight());
            pstmt.setDouble(6,student.getWeight());
            pstmt.setInt(7,student.getFhl());
            pstmt.setDouble(8,student.getTqq());

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

    public Boolean deleteStudent(Student student){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="delete from stu where sno= ? and name= ?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,student.getSno());
            pstmt.setString(2,student.getName());

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

    public List<Student> findAll() throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        List<Student> students = new ArrayList<Student>();
        con = jdbcUtil.getConn();
        prepStmt = con.prepareStatement("select * from stu");
        rs = prepStmt.executeQuery();
        while (rs.next()) {
            Student student = new Student();
            student.setSno(rs.getString(1));
            student.setName(rs.getString(2));
            student.setAge(rs.getInt(3));
            student.setSex(rs.getString(4));
            student.setHeight(rs.getDouble(5));
            student.setWeight(rs.getDouble(6));
            student.setFhl(rs.getInt(7));
            student.setTqq(rs.getDouble(8));
            students.add(student);
        }
        jdbcUtil.free(rs, prepStmt,con);
        return students;
    }

    public Boolean updateStudent(Student student){
        //1.创建链接：
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            //1.创建链接：
            conn=jdbcUtil.getConn();
            String sql="update stu set sno=?, name=?,age=?,sex=?,height=?,weight=?,fhl=?,tqq=? where sno=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,student.getSno());
            pstmt.setString(2,student.getName());
            pstmt.setInt(3,student.getAge());
            pstmt.setString(4,student.getSex());
            pstmt.setDouble(5,student.getHeight());
            pstmt.setDouble(6,student.getWeight());
            pstmt.setInt(7,student.getFhl());
            pstmt.setDouble(8,student.getTqq());
            pstmt.setString(9,student.getSno());
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

    public Student findStudent(Student student) throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        Student stu = null;
        try {
        con = jdbcUtil.getConn();
        prepStmt = con.prepareStatement("select * from stu where sno= ? ");
        prepStmt.setString(1, student.getSno());
        rs = prepStmt.executeQuery();
         if (rs.next()) {
            stu = new Student();
            stu.setSno(rs.getString(1));
            stu.setName(rs.getString(2));
            stu.setAge(rs.getInt(3));
            stu.setSex(rs.getString(4));
            stu.setHeight(rs.getDouble(5));
            stu.setWeight(rs.getDouble(6));
            stu.setFhl(rs.getInt(7));
            stu.setTqq(rs.getDouble(8));
        }
        } catch (Exception e) {
            // handle exception
        } finally {
            jdbcUtil.free(rs, prepStmt,con);
        }
        return stu;
    }
}

