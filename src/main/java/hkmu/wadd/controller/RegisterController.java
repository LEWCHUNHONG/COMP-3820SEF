package hkmu.wadd.controller;

import hkmu.wadd.dao.UserManagementService;
import jakarta.annotation.Resource;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;

@Controller
@RequestMapping("/Register")
public class RegisterController {

    @Resource
    UserManagementService umService;

    public static class Form {
        @NotBlank
        private String username;

        @NotBlank
        private String password;

        @NotBlank
        private String fullname;

        @NotBlank
        @Email
        private String email;

        @NotBlank
        private String phone;

        private String[] roles;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getFullname() {
            return fullname;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }

    @GetMapping
    public ModelAndView createRegister() {
        return new ModelAndView("Register", "register", new Form());
    }

    @PostMapping
    public String createRegister(Form form) throws IOException {
        umService.createCommentUser(
                form.getUsername(),
                form.getPassword(),
                form.getFullname(),
                form.getEmail(),
                form.getPhone(),
                form.getRoles()
        );
        return "redirect:/index";
    }
}
