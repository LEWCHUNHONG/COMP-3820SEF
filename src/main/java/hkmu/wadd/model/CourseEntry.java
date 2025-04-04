package hkmu.wadd.model;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class CourseEntry {
    private long id;
    private String name;
    private String comment;
    private final Map<String, Attachment> attachments = new ConcurrentHashMap<>();
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

    // Attachment management methods
    public Attachment getAttachment(String attachmentId) {
        return attachments.get(attachmentId);
    }

    public Collection<Attachment> getAttachments() {
        return Collections.unmodifiableCollection(attachments.values());
    }

    public void addAttachment(Attachment attachment) {
        if (attachment != null && attachment.getId() != null) {
            attachments.put(attachment.getId(), attachment);
        }
    }

    public boolean removeAttachment(String attachmentId) {
        return attachments.remove(attachmentId) != null;
    }

    public void clearAttachments() {
        attachments.clear();
    }

    public void setAttachments(Collection<Attachment> newAttachments) {
        clearAttachments();
        if (newAttachments != null) {
            newAttachments.forEach(this::addAttachment);
        }
    }

    public int getNumberOfAttachments() {
        return attachments.size();
    }

    public Map<String, Attachment> getAttachmentsMap() {
        return new ConcurrentHashMap<>(attachments);
    }

}