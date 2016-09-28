package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DAO{
    DBConnect dbconnect = null;
    String sql = "";

    public DAO() {
        dbconnect = new DBConnect();
    }

    public void insertMember(memberDTO dto){
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
}

