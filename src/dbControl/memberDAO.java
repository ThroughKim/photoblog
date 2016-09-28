package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    DBConnect dbconnect = null;
    String sql = "";

    public MemberDAO() {
        dbconnect = new DBConnect();
    }

    //회원가입 기능 구현
    public void insertMember(MemberDTO dto) throws Exception{
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

    // 프사 얻어오기
    public String getProfileImg(int user_id)throws Exception{
        Connection  con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String profileImg = null;

        try{
            sql = "SELECT profile_img from insta.members WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, user_id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                profileImg = rs.getString("profile_img");
            }else{
                profileImg = "/images/no_profile_img.jpg";
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
        return profileImg;
    }

    public String getUsername(int user_id)throws Exception{
        Connection  con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String nickName = null;

        try{
            sql = "SELECT username from insta.members WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, user_id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                nickName = rs.getString("username");
            }else{
                nickName = "username_error";
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
        return nickName;
    }

}

