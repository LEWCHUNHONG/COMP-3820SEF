package hkmu.wadd.controller;

import hkmu.wadd.dao.PollEntryRepository;
import hkmu.wadd.model.PollEntry;
import hkmu.wadd.model.PollForm;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Poll")
public class PollController {

    @Resource
    private PollEntryRepository peRepo;

    @GetMapping
    public String index(ModelMap model) {
        try {
            model.addAttribute("polles", peRepo.findActivePolls());
            return "Poll";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Failed to load polls");
            return "error";
        }
    }

    @GetMapping("/{id}")
    public String showPoll(@PathVariable Long id, ModelMap model) {
        PollEntry poll = peRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Poll not found"));
        model.addAttribute("poll", poll);
        return "PollInfo";
    }

    @PostMapping("/{id}/vote")
    public String vote(@PathVariable long id,
                       @RequestParam String selectedOption,
                       RedirectAttributes redirectAttributes) {
        peRepo.findById(id).ifPresent(poll -> {
            poll.voteForOption(selectedOption);
            peRepo.save(poll);
        });
        redirectAttributes.addFlashAttribute("successMessage", "Your vote for '" + selectedOption + "' has been recorded!");
        return "redirect:/Poll";
    }

    @GetMapping("/add")
    public String addPollForm(ModelMap model) {
        model.addAttribute("pollForm", new PollForm());
        return "AddPoll";
    }

    @PostMapping("/add")
    public String addPollHandle(@ModelAttribute("pollForm") PollForm pollForm,
                                BindingResult result,
                                ModelMap model) {
        try {
            if (result.hasErrors()) {
                return "AddPoll";
            }
            PollEntry poll = new PollEntry();
            poll.setQuestion(pollForm.getQuestion());
            List<String> options = pollForm.getOptions() != null ?
                    pollForm.getOptions() : new ArrayList<>();
            poll.setOptions(options);
            peRepo.save(poll);
            return "redirect:/Poll";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Failed to create poll: " + e.getMessage());
            return "AddPoll";
        }
    }

    @GetMapping("/edit/{id}")
    public String editPollForm(@PathVariable("id") long entryId, ModelMap model) {
        PollEntry poll = peRepo.findById(entryId)
                .orElseThrow(() -> new RuntimeException("Poll not found"));

        PollForm pollForm = new PollForm();
        pollForm.setQuestion(poll.getQuestion());
        pollForm.setOptions(poll.getOptions());

        model.addAttribute("pollForm", pollForm);
        model.addAttribute("pollId", entryId);
        return "EditPoll";
    }

    @PostMapping("/edit/{id}")
    public String editPollHandle(@PathVariable("id") long entryId,
                                 @ModelAttribute("pollForm") PollForm pollForm,
                                 BindingResult result) {
        if (result.hasErrors()) {
            return "EditPoll";
        }

        peRepo.findById(entryId).ifPresent(poll -> {
            poll.setQuestion(pollForm.getQuestion());
            poll.setOptions(pollForm.getOptions());
            peRepo.save(poll);
        });

        return "redirect:/Poll/" + entryId;
    }

    @GetMapping("/delete/{id}")
    public String deletePollEntry(@PathVariable("id") Long entryId) {
        peRepo.findById(entryId).ifPresent(poll -> {
            poll.setDeleted(true);
            peRepo.save(poll);
        });
        return "redirect:/Poll";
    }
}
