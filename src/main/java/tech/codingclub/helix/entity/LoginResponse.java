package tech.codingclub.helix.entity;

public class LoginResponse {
    public  Long id;
    public Boolean isLoggedIn;
    public String message;

    public LoginResponse(Long id, Boolean isLoggedIn, String message) {
        this.id = id;
        this.isLoggedIn = isLoggedIn;
        this.message = message;
    }
}
