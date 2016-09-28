package dbControl;

/**
 * Created by throughkim on 2016. 9. 28..
 */
public class MemberDTO {
    private String nick;
    private String email;
    private String password;

    public MemberDTO(){

    }

    public MemberDTO(String nick, String email, String password){
        this.nick = nick;
        this.email = email;
        this.password = password;
    }


    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}