package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.dto.PageRequestDTO;
import org.fullstack4.studyshare.dto.StudyDTO;
import org.fullstack4.studyshare.service.StudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/study")
public class StudyController {
    private final StudyServiceIf studyService;

    @GetMapping("/list")
    public void listGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        log.info("===============================");
        log.info("StudyController >> listGET()");

        if (bindingResult.hasErrors()) {
            log.info("StudyController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

//        PageResponseDTO<StudyDTO> responseDTO = studyService.studyListByPage(pageRequestDTO);
        List<StudyDTO> responseDTO = studyService.studyList();
        model.addAttribute("responseDTO", responseDTO);

        log.info("===============================");
    }
}