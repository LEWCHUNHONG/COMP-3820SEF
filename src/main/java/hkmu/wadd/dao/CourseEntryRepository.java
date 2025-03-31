package hkmu.wadd.dao;

import hkmu.wadd.model.CourseEntry;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseEntryRepository extends JpaRepository<CourseEntry, Long> {
}
