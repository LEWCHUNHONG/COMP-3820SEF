package hkmu.wadd.controller;

import hkmu.wadd.dao.CourseCommentEntryRepository;
import hkmu.wadd.model.CourseCommentEntry;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@RequestMapping("/Comment")

public class CommentController {

    @Resource
    private CourseCommentEntryRepository cceRep;

    private final Map<Long, CourseCommentEntry> deletedComments = new ConcurrentHashMap<>();

    @GetMapping
    public String index(ModelMap model) {
        model.addAttribute("coursecomments", cceRep.findAll());
        return "Comment";
    }

    @GetMapping("/add")
    public ModelAndView addCommentForm() {
        return new ModelAndView("AddComment", "comment", new CourseCommentEntry());
    }

    @PostMapping("/add")
    public View addCommentHandle(@ModelAttribute("coursecomments") CourseCommentEntry comment) {
        cceRep.save(comment);
        return new RedirectView("..");
    }

    @GetMapping("/delete/{id}")
    public String deleteComment(@PathVariable("id") long entryId) {
        CourseCommentEntry deleteComm = cceRep.findById(entryId).orElse(null);
        if (deleteComm == null) {
            return "redirect:/Course";
        }
        cceRep.deleteById(entryId);
        return "redirect:/Course";
    }

    @PostMapping("/delete/{id}")
    public String deleteCommenthandle(@PathVariable("id") long id) {
        cceRep.findById(id).ifPresent(comment -> {
            deletedComments.put(id, comment);
            cceRep.deleteById(id);
        });
        return "redirect:/Course";
    }

    @GetMapping("/history")
    public String getCommentHistory(ModelMap model) {
        model.addAttribute("deletedComments", new ArrayList<>(deletedComments.values()));
        return "HistoryComment";
    }

}
