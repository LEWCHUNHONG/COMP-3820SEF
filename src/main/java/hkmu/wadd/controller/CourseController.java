package hkmu.wadd.controller;

import hkmu.wadd.dao.*;
import hkmu.wadd.model.*;
import hkmu.wadd.view.DownloadingView;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import org.apache.commons.lang3.RandomStringUtils;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


@Controller
@RequestMapping("/Course")
public class CourseController {

    @Resource
    private CourseCommentEntryRepository cceRep;

    @PersistenceContext
    private EntityManager entityManager;


    private volatile long COURSE_ID_SEQUENCE = 1;
    private Map<Long, CourseEntry> CourseNotesDatabase = new ConcurrentHashMap<>();


    @GetMapping({"", "/"})
    public String index(ModelMap model) {
        model.addAttribute("CourseNotesDatabase", CourseNotesDatabase);
        return "Course";
    }



    @GetMapping("/add")
    public ModelAndView addCourseForm() {
        return new ModelAndView("AddCourse", "courseForm", new Form());
    }

    public static class Form {
        private String name;
        private String comment;
        private List<MultipartFile> attachments;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }

    @PostMapping("/add")
    public View create(Form form) throws IOException {
        CourseEntry course = new CourseEntry();
        course.setId(this.getNextTicketId());
        course.setName(form.getName());
        course.setComment(form.getComment());

        for (MultipartFile filePart : form.getAttachments()) {
            Attachment attachment = new Attachment();
            attachment.setId(RandomStringUtils.randomAlphanumeric(8));
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null && attachment.getContents().length > 0)
                course.addAttachment(attachment);
        }
        this.CourseNotesDatabase.put(course.getId(), course);
        return new RedirectView("/Course/view/" + course.getId(), true);
    }

    private synchronized long getNextTicketId() {
        return this.COURSE_ID_SEQUENCE++;
    }





    @GetMapping("/view/{courseId}")
    public String view(@PathVariable("courseId") long courseId,
                       ModelMap model) {
        CourseEntry course = this.CourseNotesDatabase.get(courseId);
        if (course == null) {
            return "redirect:/Course";
        }
        model.addAttribute("courseId", courseId);
        model.addAttribute("course", course);
        model.addAttribute("coursecomments", cceRep.findAll());

        return "CourseInfo";
    }







    @GetMapping("/{courseId}/attachment/{attachment:.+}")
    public View download(@PathVariable("courseId") long courseId,
                         @PathVariable("attachment") String AttachmentId) {
        CourseEntry course = this.CourseNotesDatabase.get(courseId);
        if (course != null) {
            Attachment attachment = course.getAttachment(AttachmentId);
            if (attachment != null)
                return new DownloadingView(attachment.getName(),
                        attachment.getMimeContentType(), attachment.getContents());
        }
        return new RedirectView("/Course", true);
    }





    @GetMapping("/view/edit/{courseId}")
    public String editCourseMaterialForm(@PathVariable("courseId") long courseId,
                       ModelMap model) {
        CourseEntry courseEdit = this.CourseNotesDatabase.get(courseId);
        if (courseEdit == null) {
            return "redirect:/Course";
        }
        model.addAttribute("editcourse", courseEdit);
        return "EditCourse";
    }


    @PostMapping("/view/edit/{courseId}")
    public String editCourseMaterialHandle(@PathVariable("courseId") long courseId,
                                 @ModelAttribute("editcourse") CourseEntry courseEdit) {

        CourseNotesDatabase.put(courseId, courseEdit);
        return "redirect:/Course";
    }














    @GetMapping("/view/delete/{courseId}")
    public String deleteCourseEntry(@PathVariable("courseId") long courseId) {
        CourseEntry courseDelete = this.CourseNotesDatabase.get(courseId);
        if (courseDelete == null) {
            return "redirect:/Course";
        }
        CourseNotesDatabase.remove(courseId);
        return "redirect:/Course";
    }

}
