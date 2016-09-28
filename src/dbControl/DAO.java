package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ExecutionException;

public class DAO{
    DBConnect dbconnect = null;
    String sql = "";

    public DAO() {
        dbconnect = new DBConnect();
    }

    //회원가입 기능 구현
    public void insertMember(memberDTO dto) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;

        try {
            sql = "INSERT INTO insta.members(USERNAME, EMAIL, PASSWORD) VALUES(?,?,?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, dto.getNick());
            pstmt.setString(2, dto.getEmail());
            pstmt.setString(3, dto.getPassword());

            pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
    }

    // 로그인기능 구현
    public int userCheck(String email, String password) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbpassword = "";
        int x = -1;

        try {
            sql = "SELECT password from insta.members WHERE email = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if(rs.next()){
                dbpassword = rs.getString("password");
                if(dbpassword.equals(password))
                    x = 1; //인증성공
                else
                    x = 0; //인증실패
            }
            else
                x = -1; //일치하는 이메일 없음
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
        return x;
    }
}

