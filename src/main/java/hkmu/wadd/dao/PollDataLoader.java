package hkmu.wadd.dao;

import hkmu.wadd.model.PollEntry;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Repository;

import java.util.Arrays;

@Repository
public class PollDataLoader {
    @Resource
    private PollEntryRepository peRepo;

    @PostConstruct
    public void loadTestData() {
        PollEntry poll = new PollEntry();
        poll.setQuestion("Favorite Color?");
        poll.setOptions(Arrays.asList("Red", "Blue", "Green"));
        peRepo.save(poll);
    }
}
