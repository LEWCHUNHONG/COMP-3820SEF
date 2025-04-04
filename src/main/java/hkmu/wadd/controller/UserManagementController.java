package hkmu.wadd.controller;

import hkmu.wadd.dao.UserManagementService;
import hkmu.wadd.model.CommentUser;
import hkmu.wadd.model.UserRole;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;

@Controller
@RequestMapping("/User")
public class UserManagementController {

    @Resource
    private UserManagementService umService;

    private String getCurrentUsername() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    @GetMapping("/list")
    public String userList(ModelMap model) {
        model.addAttribute("users", umService.getCommentUsers());
        return "UserInfo";
    }

    public static class UserForm {
        private String username;
        private String password;
        private String fullname;
        private String email;
        private String phone;
        private String[] roles;
        private List<UserRole> userRoles;

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

        public List<UserRole> getUserRoles() {
            return userRoles;
        }

        public void setUserRoles(List<UserRole> userRoles) {
            this.userRoles = userRoles;
        }
    }

    public static class SelfEditForm {
        private String password;
        private String fullname;
        private String email;
        private String phone;

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
    }

    @GetMapping("/edit/{username}")
    public ModelAndView showEditForm(@PathVariable("username") String username) {
        CommentUser user = umService.getUserByUsername(username);
        if (user == null) {
            return new ModelAndView("redirect:/User/list");
        }
        UserForm form = new UserForm();
        form.setUsername(user.getUsername());
        form.setPassword(user.getPassword());
        form.setFullname(user.getFullname());
        form.setEmail(user.getEmail());
        form.setPhone(user.getPhone());
        form.setUserRoles(user.getRoles());
        String[] roleStrings = user.getRoles().stream()
                .map(UserRole::getRole)
                .toArray(String[]::new);
        form.setRoles(roleStrings);
        ModelAndView mav = new ModelAndView("EditUser", "userForm", form);
        mav.addObject("originalUsername", username);
        return mav;
    }

    @PostMapping("/update")
    public String processEditForm(
            @RequestParam("originalUsername") String originalUsername,
            @ModelAttribute("userForm") @Valid UserForm form,
            BindingResult result,
            ModelMap model) {

        if (result.hasErrors()) {
            model.addAttribute("originalUsername", originalUsername);
            return "EditUser";
        }
        umService.updateUser(
                originalUsername,
                form.getUsername(),
                form.getPassword(),
                form.getFullname(),
                form.getEmail(),
                form.getPhone(),
                form.getRoles());
        return "redirect:/User/list";
    }

    @GetMapping("/profile/edit")
    public ModelAndView showProfileEditForm() {
        String username = getCurrentUsername();
        CommentUser user = umService.getUserByUsername(username);
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }
        ModelAndView mav = new ModelAndView("EditUserProfile");
        mav.addObject("username", user.getUsername());
        mav.addObject("password", user.getPassword().replace("{noop}", ""));
        mav.addObject("fullname", user.getFullname());
        mav.addObject("email", user.getEmail());
        mav.addObject("phone", user.getPhone());
        return mav;
    }

    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam String password,
            @RequestParam String fullname,
            @RequestParam String email,
            @RequestParam String phone) {

        String username = getCurrentUsername();
        umService.updateUserProfile(username, password, fullname, email, phone);

        return "redirect:/User/profile/edit?success";
    }

    @GetMapping("/delete/{username}")
    public String deleteUser(@PathVariable("username") String username) {
        umService.delete(username);
        return "redirect:/User/list";
    }
}