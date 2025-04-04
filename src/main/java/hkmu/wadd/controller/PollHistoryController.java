package hkmu.wadd.controller;

import hkmu.wadd.dao.PollEntryRepository;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/PollHistory")
public class PollHistoryController {

    @Resource
    private PollEntryRepository peRepo;

    @GetMapping
    public String history(ModelMap model) {
        model.addAttribute("deletedPolls", peRepo.findByDeletedTrue());
        return "PollHistory";
    }

    @GetMapping("/restore/{id}")
    public String restorePoll(@PathVariable("id") long entryId) {
        peRepo.findById(entryId).ifPresent(poll -> {
            poll.setDeleted(false);
            poll.setDeletedAt(null);
            peRepo.save(poll);
        });
        return "redirect:/PollHistory";
    }

    @GetMapping("/permanent-delete/{id}")
    public String permanentDelete(@PathVariable("id") long entryId) {
        peRepo.deleteById(entryId);
        return "redirect:/PollHistory";
    }
}