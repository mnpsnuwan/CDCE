package com.CDCE.Model;

/**
 *
 * @author nuwan
 */
public class SideMenu {

    private int id;
    private String buttonName;
    private String url;
    private int user_role;

    public String getButtonName() {
        return buttonName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setButtonName(String buttonName) {
        this.buttonName = buttonName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getUser_role() {
        return user_role;
    }

    public void setUser_role(int user_role) {
        this.user_role = user_role;
    }

}
