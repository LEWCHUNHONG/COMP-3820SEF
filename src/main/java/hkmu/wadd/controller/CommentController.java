package hkmu.wadd.controller;


import hkmu.wadd.dao.CourseCommentEntryRepository;
import hkmu.wadd.model.CourseCommentEntry;
import hkmu.wadd.model.PollEntry;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/Comment")

public class CommentController {

    @Resource
    private CourseCommentEntryRepository cceRep;


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








//    @PostMapping("/delete/{id}")
//    public String deleteCommenthandle(@PathVariable("id") long entryId) {
//        List<CourseCommentEntry> comments = cceRep.findAll();
//        List<CourseCommentEntry> activeComments = comments.stream()
//                .filter(comment -> !comment.isDeleted())
//                .collect(Collectors.toList());
//
//        CourseCommentEntry deleteComm = cceRep.findById(entryId).orElse(null);
//        if (deleteComm != null) {
//            deleteComm.setDeleted(true); // Mark as deleted instead of removing
//            cceRep.save(deleteComm); // Save the updated comment
//        }
//        return "redirect:/Course"; // Redirect to the index page
//    }
//
//
//    @GetMapping("/history")
//    public String getCommentHistory(ModelMap model) {
//        List<CourseCommentEntry> comments = cceRep.findAll();
//
//        model.addAttribute("coursecomments", comments); // Include all comments
//        return "HistoryComment"; // Return the view name for the history page
//    }



}
