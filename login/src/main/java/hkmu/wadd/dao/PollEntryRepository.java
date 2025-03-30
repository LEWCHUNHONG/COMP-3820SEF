package hkmu.wadd.dao;

import hkmu.wadd.model.PollEntry;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PollEntryRepository extends JpaRepository<PollEntry, Long> {
}
