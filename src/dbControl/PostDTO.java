package dbControl;

/**
 * Created by throughkim on 2016. 9. 28..
 */
public class PostDTO {
    private int id;
    private String image;
    private String content;
    private int user_id;
    private int cnt_like;
    private String create_datetime;

    public PostDTO(){

    }

    public PostDTO(int id, String image, String content,
                   int user_id, int cnt_like, String create_datetime){
        this.id = id;
        this.image = image;
        this.content = content;
        this.user_id = user_id;
        this.cnt_like = cnt_like;
        this.create_datetime = create_datetime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCnt_like() {
        return cnt_like;
    }

    public void setCnt_like(int cnt_like) {
        this.cnt_like = cnt_like;
    }

    public String getCreate_datetime() {
        return create_datetime;
    }

    public void setCreate_datetime(String create_datetime) {
        this.create_datetime = create_datetime;
    }
}
