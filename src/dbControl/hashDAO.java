package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by throughkim on 2016. 10. 18..
 */
public class hashDAO {
    DBConnect dbconnect = null;
    String sql = "";

    public hashDAO() { dbconnect = new DBConnect(); }

    public int getHashId(String content){
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int hashId = 0;

        try {
            sql="SELECT * FROM insta.hashtag WHERE content = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, content);

            rs = pstmt.executeQuery();

            if(rs.next()){
                hashId = rs.getInt("id");
            }else{
                hashId = 0;
            }

        }catch (Exception e){

        }finally {
            DBClose.close(con, pstmt);
        }

        return hashId;
    }

    public int insertHash(String content){
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        int checkNum = -1;

        try{
            sql="INSERT INTO insta.hashtag(content) VALUES(?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, content);
            pstmt.executeUpdate();

            checkNum = 1;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
        return checkNum;
    }

    public int makeHashPostRel(int hashId, int postId){

    }
}
