package dbControl;

/**
 * Created by throughkim on 2016. 9. 28..
 */
public class postDTO {
    private int post_id;
    private String post_image;
    private String post_content;
    private int post_user_id;
    private int cnt_like;
    private int cnt_comment;
    private String create_datetime;

    public postDTO(){

    }

    public postDTO(int post_id, String post_image, String post_content,
                   int post_user_id, int cnt_like, int cnt_comment, String create_datetime){
        this.post_id = post_id;
        this.post_image = post_image;
        this.post_content = post_content;
        this.post_user_id = post_user_id;
        this.cnt_like = cnt_like;
        this.cnt_comment = cnt_comment;
        this.create_datetime = create_datetime;
    }
    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getPost_image() {
        return post_image;
    }

    public void setPost_image(String post_image) {
        this.post_image = post_image;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    public int getPost_user_id() {
        return post_user_id;
    }

    public void setPost_user_id(int post_user_id) {
        this.post_user_id = post_user_id;
    }

    public int getCnt_like() {
        return cnt_like;
    }

    public void setCnt_like(int cnt_like) {
        this.cnt_like = cnt_like;
    }

    public int getCnt_comment() {
        return cnt_comment;
    }

    public void setCnt_comment(int cnt_comment) {
        this.cnt_comment = cnt_comment;
    }

    public String getCreate_datetime() {
        return create_datetime;
    }

    public void setCreate_datetime(String create_datetime) {
        this.create_datetime = create_datetime;
    }
}
