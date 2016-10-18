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
    public List<PostDTO> getTotalList() throws Exception{
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

    //개별 포스팅 불러오기
    public PostDTO getSinglePost(int postId) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        PostDTO post = null;

        try {
            sql = "SELECT * FROM insta.post WHERE id = ?";
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, postId);
            rs = pstmt.executeQuery();

            if(rs.next()){
                post = new PostDTO();
                post.setId(rs.getInt("id"));
                post.setImage(rs.getString("image"));
                post.setContent(rs.getString("content"));
                post.setUser_id(rs.getInt("user_id"));
                post.setCnt_like(rs.getInt("cnt_like"));
            }else{
                post = null;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
        return post;
    }

    //요청 유저의 게시물만 불러오기
    public List<PostDTO> getList(int user_id) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PostDTO>list = null;

        try{
            sql = "SELECT * FROM insta.post WHERE user_id = ? ORDER BY id DESC";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, user_id);

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

    //팔로워의 게시물만 불러오기
    public List<PostDTO> getFollwersPost(int user_id) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PostDTO>list = null;

        try{
            sql = "SELECT * FROM insta.post " +
                    "WHERE user_id IN (SELECT following_id FROM insta.follow WHERE user_id = ?)" +
                    "OR (user_id = ?)" +
                    "ORDER BY id DESC";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, user_id);
            pstmt.setInt(2, user_id);

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

    //글 입력하기
    public int insertPost(String image, String content, int userId) throws Exception {
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;

        int check = 0;

        try {
            sql = "INSERT INTO insta.post(IMAGE, CONTENT, USER_ID) VALUES(?,?,?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, image);
            pstmt.setString(2, content);
            pstmt.setInt(3, userId);

            pstmt.executeUpdate();

            insertHashTag(content);

            check = 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(con, pstmt);
        }
        return check;
    }

    public void insertHashTag(String content){
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        HashTagGenerator hash = new HashTagGenerator();
        String url = "/hashPostView.jsp?hash=";
        ResultSet rs = null;

        try{
            sql = "SELECT id, content FROM insta.post WHERE content = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, content);

            pstmt.executeUpdate();

            if(rs.next()){
                String oldContent = rs.getString("content");
                int postId = rs.getInt("id");
                String newContent = hash.setAutoLinkHashTag(url, oldContent, postId);

                sql = "UPDATE insta.post SET content = ? WHERE id = ?";
                pstmt = con.prepareStatement(sql);

                pstmt.setString(1, newContent);
                pstmt.setInt(2, postId);

                pstmt.executeUpdate();
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBClose.close(con, pstmt);
        }
    }

    //게시물 삭제
    public int deletePost(int post_id) throws Exception{
        Connection con = dbconnect.getConnection();
        PreparedStatement pstmt = null;
        int check = 0;

        try{
            sql="DELETE FROM insta.post WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, post_id);

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
