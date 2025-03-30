package hkmu.wadd.controller;


import hkmu.wadd.dao.RegisterEntryRepository;
import hkmu.wadd.model.RegisterEntry;
import jakarta.annotation.Resource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
// other imports

@Controller
@RequestMapping("/Register")
public class RegisterController {

    @Resource
    private RegisterEntryRepository reRepo;

    @GetMapping
    public ModelAndView addRegisterForm() {
        return new ModelAndView("Register", "register", new RegisterEntry());
    }

    @PostMapping
    public RedirectView addRegisterHandle(@ModelAttribute("register") RegisterEntry rEntry) {
        // Save the register entry to the H2 database
        reRepo.save(rEntry);

        return new RedirectView("/login");
    }
}