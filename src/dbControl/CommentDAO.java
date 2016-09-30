package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

/**
 * Created by throughkim on 2016. 9. 29..
 */
public class CommentDAO {
    DBConnect dbconnect = null;
    String sql = "";

    public CommentDAO() {
        dbconnect = new DBConnect();
    }

    //댓글 전체 목록 가져오기
    public List<CommentDTO> getList(int post_id) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO>list = null;

        try{
            sql = "SELECT * FROM insta.comment WHERE post_id= ? ORDER BY id DESC ";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, post_id);

            rs = pstmt.executeQuery();

            if(rs.next()){
                list = new ArrayList<CommentDTO>();

                do{
                    CommentDTO comment = new CommentDTO();
                    comment.setId(rs.getInt("id"));
                    comment.setContent(rs.getString("content"));
                    comment.setUser_id(rs.getInt("user_id"));
                    comment.setPost_id(rs.getInt("post_id"));
                    list.add(comment);
                }while(rs.next());
            }else {
                list = Collections.EMPTY_LIST;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con,pstmt);
        }
        return list;
    }
}
