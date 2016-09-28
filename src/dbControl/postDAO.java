package dbControl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

import dbControl.PostDTO;

/**
 * Created by throughkim on 2016. 9. 28..
 */
public class PostDAO {
    DBConnect dbconnect = null;
    String sql = "";

    public PostDAO() {
        dbconnect = new DBConnect();
    }

    //글목록 가져오기
    public List<PostDTO> getList() throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PostDTO>list = null;

        try{
            sql = "SELECT * FROM insta.post ORDER BY id DESC";
            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            if(rs.next()){
                list = new ArrayList<PostDTO>();

                do{
                    PostDTO post = new PostDTO();
                    post.setId(rs.getInt("id"));
                    post.setImage(rs.getString("image"));
                    post.setContent(rs.getString("content"));
                    post.setUser_id(rs.getInt("user_id"));
                    post.setCnt_like(rs.getInt("cnt_like"));
                    post.setCnt_comment(rs.getInt("cnt_comment"));
                    list.add(post);
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
