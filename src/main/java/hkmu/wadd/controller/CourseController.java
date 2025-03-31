package hkmu.wadd.controller;

import hkmu.wadd.dao.*;
import hkmu.wadd.model.*;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;



@Controller
@RequestMapping("/Course")
public class CourseController {

    @Resource
    private CourseEntryRepository ceRepo;

    @Resource
    private CourseCommentEntryRepository cceRepo;

    @GetMapping({"", "/"})
    public String index(ModelMap model) {
        model.addAttribute("courses", ceRepo.findAll());
        model.addAttribute("AddCourseComments", cceRepo.findAll());
        return "Course";
    }

    @GetMapping("/add")
    public ModelAndView addCourseForm() {
        return new ModelAndView("AddCourse", "course", new CourseEntry());
    }

    @PostMapping("/add")
    public View addCourseHandle(@ModelAttribute("course") CourseEntry cEntry) {
        ceRepo.save(cEntry);
        return new RedirectView(".");
    }

    @GetMapping("/addCourseComment")
    public ModelAndView addCourseCommentForm() {
        return new ModelAndView("AddCourseComment", "addcoursecomment", new CourseCommentEntry());
    }

    @PostMapping("/addCourseComment")
    public View addCourseCommentHandle(@ModelAttribute("addcoursecomment") CourseCommentEntry ccEntry) {
        cceRepo.save(ccEntry);
        return new RedirectView(".");
    }

    @GetMapping("/edit/{id}")
    public String editCourseForm(@PathVariable("id") long entryId, ModelMap model) {
        CourseEntry entry = ceRepo.findById(entryId).orElse(null);
        if (entry == null) {
            return "redirect:/Course";
        }
        model.addAttribute("course", entry);
        return "EditCourse";
    }

    @PostMapping("/edit/{id}")
    public String editCourseHandle(@PathVariable("id") long entryId, @ModelAttribute("course") CourseEntry cEntry) {
        if (cEntry.getId() == entryId) {
            ceRepo.save(cEntry);
        }
        return "redirect:.."; // Another way to redirect in Spring MVC
    }

    @GetMapping("/delete/{id}")
    public String deleteCourseEntry(@PathVariable("id") long entryId) {
        CourseEntry entry = ceRepo.findById(entryId).orElse(null);
        if (entry == null) {
            return "redirect:/Course";
        }
        ceRepo.deleteById(entryId);
        return "redirect:/Course";
    }
}
