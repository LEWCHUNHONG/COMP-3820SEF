package hkmu.wadd.model;

import jakarta.persistence.*;
import java.util.*;
import java.util.stream.Collectors;

@Entity
@Table(name = "poll")
public class PollEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String question;

    // Store choices and votes as JSON format: {"choice1":0,"choice2":0}
    @Column(columnDefinition = "TEXT")
    private String choices;

    @Column(nullable = false)
    private boolean deleted = false;

    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", updatable = false)
    private Date createdAt = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt = new Date();

    // Lifecycle hooks
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
        updatedAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }

    // Voting methods
    public Map<String, Integer> getOptionsWithVotes() {
        if (choices == null || choices.trim().isEmpty()) {
            return new LinkedHashMap<>();
        }
        try {
            return new com.fasterxml.jackson.databind.ObjectMapper()
                    .readValue(choices, new com.fasterxml.jackson.core.type.TypeReference<Map<String, Integer>>(){});
        } catch (Exception e) {
            // Fallback to old format if JSON parsing fails
            return Arrays.stream(choices.split(","))
                    .collect(Collectors.toMap(
                            option -> option.split(":")[0],
                            option -> Integer.parseInt(option.split(":")[1]),
                            (oldValue, newValue) -> oldValue,
                            LinkedHashMap::new
                    ));
        }
    }

    public void setOptions(List<String> options) {
        Map<String, Integer> optionsMap = new LinkedHashMap<>();
        options.forEach(option -> optionsMap.put(option, 0));
        try {
            this.choices = new com.fasterxml.jackson.databind.ObjectMapper()
                    .writeValueAsString(optionsMap);
        } catch (Exception e) {
            // Fallback to old format
            this.choices = options.stream()
                    .map(option -> option + ":0")
                    .collect(Collectors.joining(","));
        }
    }

    public void voteForOption(String option) {
        Map<String, Integer> optionsMap = getOptionsWithVotes();
        if (optionsMap.containsKey(option)) {
            optionsMap.put(option, optionsMap.get(option) + 1);
            // Update the choices string
            this.choices = optionsMap.entrySet().stream()
                    .map(e -> e.getKey() + ":" + e.getValue())
                    .collect(Collectors.joining(","));
        }
    }

    public List<String> getOptions() {
        return new ArrayList<>(getOptionsWithVotes().keySet());
    }

    public void markAsDeleted() {
        this.deleted = true;
        this.deletedAt = new Date();
    }

    public void restore() {
        this.deleted = false;
        this.deletedAt = null;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getChoices() { return choices; }
    public void setChoices(String choices) { this.choices = choices; }
    public boolean isDeleted() { return deleted; }
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
        this.deletedAt = deleted ? new Date() : null;
    }
    public Date getDeletedAt() { return deletedAt; }
    public void setDeletedAt(Date deletedAt) { this.deletedAt = deletedAt; }
    public Date getCreatedAt() { return createdAt; }
    public Date getUpdatedAt() { return updatedAt; }

    public PollEntry() {}

    public PollEntry(String question, List<String> options) {
        this.question = question;
        this.setOptions(options);
    }

    @Override
    public String toString() {
        return "PollEntry{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", choices='" + choices + '\'' +
                ", deleted=" + deleted +
                ", deletedAt=" + deletedAt +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}