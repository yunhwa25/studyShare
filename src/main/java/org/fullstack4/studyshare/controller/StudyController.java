package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.dto.PageRequestDTO;
import org.fullstack4.studyshare.dto.PageResponseDTO;
import org.fullstack4.studyshare.dto.StudyDTO;
import org.fullstack4.studyshare.service.StudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
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
            Model model,
            HttpSession session
    ) {
        log.info("===============================");
        log.info("StudyController >> listGET()");

        if (bindingResult.hasErrors()) {
            log.info("StudyController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<StudyDTO> responseDTO = studyService.studyListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);

//        String writer = (String)session.getAttribute("loginInfo");
//        PageResponseDTO<StudyDTO> responseDTO2 = studyService.studyListByPage2(pageRequestDTO, writer);
//        model.addAttribute("responseDTO2", responseDTO2);

        log.info("===============================");
    }

    @GetMapping("/view")
    public void viewGET(@RequestParam(name="idx", defaultValue = "0") int idx,
                     Model model) {
        log.info("===============================");
        log.info("StudyController >> viewGET()");
        log.info("idx : " + idx);

        StudyDTO studyDTO = studyService.studyView(idx);
//        BbsDTO bbsDTO = bbsServiceIf.view(idx);
//        List<BbsReplyDTO> bbsReplyDTOList = bbsReplyServiceIf.reply_list(idx);

        model.addAttribute("bbs", studyDTO);
//        model.addAttribute("bbsReply", bbsReplyDTOList);
        log.info("===============================");
    }

    @GetMapping("/regist")
    public void registGET() {
        log.info("===============================");
        log.info("StudyController >> registGET()");
        log.info("===============================");
    }

    @PostMapping("/regist")
    public String registPOST(@Valid StudyDTO studyDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("===============================");
        log.info("StudyController >> registPOST()");
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO", studyDTO);
            return "redirect:/study/regist";
        }
        int result = studyService.studyRegist(studyDTO);
        if (result > 0) {
            return "redirect:/study/list";
        }
        else {
            return "/study/regist";
        }

    }


}