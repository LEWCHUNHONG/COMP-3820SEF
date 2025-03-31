package hkmu.wadd.dao;

import hkmu.wadd.model.RegisterEntry;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisterEntryRepository extends JpaRepository<RegisterEntry, Long> {
}
