package hkmu.wadd.dao;

import hkmu.wadd.model.CourseCommentEntry;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CourseCommentEntryRepository extends JpaRepository<CourseCommentEntry, Long>  {
}
