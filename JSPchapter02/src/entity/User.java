package entity;

public class User {
    private String name;
    private String psw;
    public User(String name, String psw){
        super();
        this.name = name;
        this.psw = psw;
    }
    public User(){
        super();
    }
    public String getName(){
        return this.name;
    }
}
