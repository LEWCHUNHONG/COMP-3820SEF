package hkmu.wadd.dao;

import hkmu.wadd.model.PollEntry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PollEntryRepository extends JpaRepository<PollEntry, Long> {
    List<PollEntry> findByDeletedFalse();
    List<PollEntry> findByDeletedTrue();

    @Query("SELECT p FROM PollEntry p WHERE p.deleted = false")
    List<PollEntry> findActivePolls();

}