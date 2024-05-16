package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.dto.MemberDTO;
import org.fullstack4.studyshare.service.LoginServiceIf;
import org.fullstack4.studyshare.service.MemberServiceIf;
import org.fullstack4.studyshare.utils.CookieUtil;
import org.fullstack4.studyshare.utils.DiffDateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/member")
public class MemberController {
    private final MemberServiceIf memberService;

    @GetMapping("/view")
    public void viewGET(
            HttpSession session,
            Model model
    ) {

        log.info("===============================");
        log.info("MemberController >> viewGET()");
        log.info("user_id : " + session.getAttribute("loginInfo"));

        MemberDTO memberDTO = memberService.view((String)session.getAttribute("loginInfo"));
        memberDTO.setEmail_id(memberDTO.getEmail_id(memberDTO.getEmail()));
        memberDTO.setEmail_domain(memberDTO.getEmail_domain(memberDTO.getEmail()));
        memberDTO.setPhone_0(memberDTO.getPhone_0(memberDTO.getPhone()));
        memberDTO.setPhone_1(memberDTO.getPhone_1(memberDTO.getPhone()));
        memberDTO.setPhone_2(memberDTO.getPhone_2(memberDTO.getPhone()));
        model.addAttribute("memberDTO", memberDTO);
        log.info("memberDTO : " + memberDTO.toString() );
        log.info("===============================");
    }


    @PostMapping("/modify")
    public String modifyPOST(@Valid MemberDTO memberDTO,
                             HttpSession session,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("===============================");
        log.info("MemberController >> modifyPOST()");
        log.info("memberDTO : " + memberDTO.toString());
        log.info("===============================");

        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/view?user_id="+memberDTO.getUser_id();
        }

        MemberDTO dto = memberService.view((String)session.getAttribute("loginInfo"));
        dto.setEmail(memberDTO.getEmail_id(), memberDTO.getEmail_domain());
        dto.setPhone(memberDTO.getPhone_0(), memberDTO.getPhone_1(), memberDTO.getPhone_2());

        log.info("dto :" + dto);
        int result = memberService.modify(dto);
        log.info("result : " + result);
        log.info("===============================");

        if (result > 0) {
            redirectAttributes.addFlashAttribute("result", "정상적으로 수정되었습니다.");
            return "redirect:/member/view";
        }
        else {
            return "redirect:/member/view?user_id="+memberDTO.getUser_id();
        }
    }

    @GetMapping("/leave")
    public String leaveGET(
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("MemberController >> leaveGET()");

        String user_id = (String)session.getAttribute("loginInfo");
        int result = memberService.leave(user_id);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("result", "정상적으로 탈퇴 처리되었습니다.");
            session.invalidate();
            return "redirect:/";
        }
        else {
            return "/member/view";
        }
    }

    @GetMapping("/join")
    public void joinGET(
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("MemberController >> joinGET()");
        log.info("===============================");
    }


}
