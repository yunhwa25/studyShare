package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.dto.*;
import org.fullstack4.studyshare.service.StudyServiceIf;
import org.fullstack4.studyshare.utils.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

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
            HttpServletRequest req
    ) {
        log.info("===============================");
        log.info("StudyController >> listGET()");

        if (bindingResult.hasErrors()) {
            log.info("StudyController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }


        HttpSession session = req.getSession();
        pageRequestDTO.setWriter((String)session.getAttribute("loginInfo"));

        PageResponseDTO<StudyDTO> responseDTO = studyService.studyListByPage(pageRequestDTO);
        log.info("responseDTO : " + responseDTO);
        log.info("dtoList : " + responseDTO.getDtoList().toString());
        model.addAttribute("responseDTO", responseDTO);


        log.info("===============================");
    }

    @GetMapping("/view")
    public void viewGET(@RequestParam(name="idx", defaultValue = "0") int idx,
                     Model model) {
        log.info("===============================");
        log.info("StudyController >> viewGET()");
        log.info("idx : " + idx);

        Map<String, StudyDTO> studyMap = studyService.studyView(idx);

        studyMap.get("studyDTO").setContent(studyMap.get("studyDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("bbs", studyMap.get("studyDTO"));

        log.info("===============================");
    }

    @GetMapping("/regist")
    public void registGET() {
        log.info("===============================");
        log.info("StudyController >> registGET()");
        log.info("===============================");
    }

    @PostMapping("/regist")
    public String registPOST(
            @RequestParam("file") MultipartFile multipartFile,
            @Valid BbsDTO bbsDTO,
            @Valid FileDTO fileDTO,
            @Valid ShareDTO shareDTO,
            HttpSession session,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("StudyController >> registPOST()");
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);
            return "redirect:/study/regist";
        }

        int bbs_idx = studyService.bbsRegist(bbsDTO);
        fileDTO.setBbs_idx(bbs_idx);

        // 파일 등록
        String save_file_name = "";

        if (!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);
        }
        fileDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        fileDTO.setSave_file_name(save_file_name);
        int result1 = studyService.fileRegist(fileDTO);


        shareDTO.setBbs_idx(bbs_idx);
        shareDTO.setSender((String)session.getAttribute("loginInfo"));
        int result2 = studyService.shareRegist(shareDTO);

        if (result1 > 0 && result2 > 0) {
            return "redirect:/study/list";
        }
        else {
            return "/study/regist";
        }

    }

    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="idx", defaultValue = "0") int idx,
                          Model model) {
        log.info("===============================");
        log.info("BbsController >> modifyGET()");
        log.info("idx : " + idx);
        log.info("===============================");



//
//        BbsDTO bbsDTO = bbsServiceIf.view(idx);
//        model.addAttribute("bbs", bbsDTO);

    }

    @PostMapping("/modify")
    public void modifyPOST(@Valid BbsDTO bbsDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("===============================");
        log.info("BbsController >> modifyPOST()");
        log.info("bbsDTO : " + bbsDTO.toString());
        log.info("===============================");

//        if(bindingResult.hasErrors()) {
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);
//            return "redirect:/bbs/modify?idx="+bbsDTO.getIdx();
//        }
//
//        int result = bbsServiceIf.modify(bbsDTO);
//        log.info("result : " + result);
//        log.info("===============================");
//
//        if (result > 0) {
//            return "redirect:/bbs/view?idx="+bbsDTO.getIdx();
//        }
//        else {
//            return "/bbs/modify";
//        }
    }


    @PostMapping("/delete")
    public void deletePOST(@RequestParam(name="idx", defaultValue = "0") int idx,
                             Model model) {
        log.info("===============================");
        log.info("BbsController >> deletePOST()");
        log.info("===============================");

//        int result = bbsServiceIf.delete(idx);
//        if (result > 0) {
//            return "redirect:/bbs/list";
//        }
//        else {
//            return "/bbs/view?idx="+idx;
//        }
    }
}