package hkmu.wadd.model;

import java.util.ArrayList;
import java.util.List;

public class PollForm {
    private String question;
    private List<String> options = new ArrayList<>();
    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<String> getOptions() {
        return options;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }
}