package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by throughkim on 2016. 10. 6..
 */
public class FollowDAO {
    DBConnect dbConnect = null;
    String sql = "";

    public FollowDAO(){ dbConnect = new DBConnect();}

    //팔로우 기능 구현
    public int following(int user_id,int following_id){
        Connection con = dbConnect.getConnection();
        PreparedStatement pstmt = null;

        int check = -1;

        try{
            sql="INSERT INTO insta.follow(user_id, following_id) VALUES(?,?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, user_id);
            pstmt.setInt(2, following_id);
            pstmt.executeUpdate();

            check = 1;

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
        return check;
    }

}
