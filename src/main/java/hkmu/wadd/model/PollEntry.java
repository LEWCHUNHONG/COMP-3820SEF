package hkmu.wadd.model;

import jakarta.persistence.*;

@Entity
@Table(name = "poll")
public class PollEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String question;
    private String choices;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getChoices() {
        return choices;
    }

    public void setChoices(String choices) {
        this.choices = choices;
    }

    public PollEntry() {
    }


    @Override
    public String toString() {
        return "PollEntry{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", choices='" + choices + '\'' +
                '}';
    }
}
