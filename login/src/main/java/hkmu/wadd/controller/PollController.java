package hkmu.wadd.controller;


import hkmu.wadd.dao.PollEntryRepository;
import hkmu.wadd.model.CourseEntry;
import hkmu.wadd.model.PollEntry;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/Poll")
public class PollController {

    @Resource
    private PollEntryRepository peRepo;

    @GetMapping({"", "/"})
    public String index(ModelMap model) {
        model.addAttribute("polles", peRepo.findAll());
        return "Poll";
    }

    @GetMapping("/add")
    public ModelAndView addPollForm() {
        return new ModelAndView("AddPoll", "poll", new PollEntry());
    }

    @PostMapping("/add")
    public View addPollHandle(@ModelAttribute("polles") PollEntry pEntry) {
        peRepo.save(pEntry);
        return new RedirectView(".");
    }

    @GetMapping("/edit/{id}")
    public String editPollForm(@PathVariable("id") long entryId, ModelMap model) {
        PollEntry entry = peRepo.findById(entryId).orElse(null);
        if (entry == null) {
            return "redirect:/Poll";
        }
        model.addAttribute("poll", entry);
        return "EditPoll";
    }

    @PostMapping("/edit/{id}")
    public String editPollHandle(@PathVariable("id") long entryId, @ModelAttribute("poll") PollEntry pEntry) {
        if (pEntry.getId() == entryId) {
            peRepo.save(pEntry);
        }
        return "redirect:.."; // Another way to redirect in Spring MVC
    }

    @GetMapping("/delete/{id}")
    public String deletePollEntry(@PathVariable("id") long entryId) {
        PollEntry entry = peRepo.findById(entryId).orElse(null);
        if (entry == null) {
            return "redirect:/Poll";
        }
        peRepo.deleteById(entryId);
        return "redirect:/Course";
    }

}
