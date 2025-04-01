package hkmu.wadd.model;

import java.util.Collection;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;



public class CourseEntry {
    private long id;
    private String name;
    private String comment;
    private Map<String, Attachment> attachments = new ConcurrentHashMap<>();


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Attachment getAttachment(String name) {
        return this.attachments.get(name);
    }

    public Collection<Attachment> getAttachments() {
        return this.attachments.values();
    }

    public void addAttachment(Attachment attachment) {
        this.attachments.put(attachment.getId(), attachment);
    }

    public int getNumberOfAttachments() {
        return this.attachments.size();
    }
}
