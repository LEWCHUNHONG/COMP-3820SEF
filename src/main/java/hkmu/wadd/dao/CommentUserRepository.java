package hkmu.wadd.dao;

import hkmu.wadd.model.CommentUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentUserRepository extends JpaRepository<CommentUser, String>{
}
