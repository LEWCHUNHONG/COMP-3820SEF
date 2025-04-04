package hkmu.wadd.dao;

import hkmu.wadd.model.CommentUser;
import hkmu.wadd.model.UserRole;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserManagementService {

    @Resource
    private CommentUserRepository cuRepo;

    @Transactional
    public List<CommentUser> getCommentUsers() {
        return cuRepo.findAll();
    }

    @Transactional(readOnly = true)
    public CommentUser getUserByUsername(String username) {
        return cuRepo.findById(username).orElse(null);
    }

    @Transactional
    public void delete(String username) {
        CommentUser user = cuRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        cuRepo.delete(user);
    }

    @Transactional
    public void createCommentUser(String username,
            String password,
            String fullname,
            String email,
            String phone,
            String[] roles) {
        CommentUser user = new CommentUser(username, password, fullname, email, phone, roles);
        cuRepo.save(user);
    }

    @Transactional
    public void updateUser(String originalUsername,
            String newUsername,
            String password,
            String fullname,
            String email,
            String phone,
            String[] roles) {

        CommentUser user = cuRepo.findById(originalUsername).orElseThrow(
                () -> new UsernameNotFoundException("User not found"));
        user.setUsername(newUsername);
        user.setPassword("{noop}" + password);
        user.setEmail(email);
        user.setPhone(phone);
        user.getRoles().clear();
        for (String role : roles) {
            user.getRoles().add(new UserRole(user, role));
        }
        cuRepo.save(user);
        if (!originalUsername.equals(newUsername)) {
            cuRepo.deleteById(originalUsername);
            cuRepo.save(user);
        }
    }

    @Transactional
    public void updateUserProfile(
            String username,
            String password,
            String fullname,
            String email,
            String phone) {
        CommentUser user = cuRepo.findById(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        user.setPassword("{noop}" + password);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setPhone(phone);
        cuRepo.save(user);
    }
}