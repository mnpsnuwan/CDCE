package com.CDCE.Model;

/**
 *
 * @author nuwan
 */
public class ApplicationAttachment {
    
    private int id;
    private int applicationId;
    private int attachmentId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(int attachmentId) {
        this.attachmentId = attachmentId;
    }
    
}
