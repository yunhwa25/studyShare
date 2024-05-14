package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.dto.MemberDTO;
import org.fullstack4.studyshare.service.LoginServiceIf;
import org.fullstack4.studyshare.utils.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/login")
public class LoginController {
    private final LoginServiceIf loginService;

    @GetMapping("/login")
    public void loginGET(
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("LoginController >> loginGET()");

//        model.addAttribute("acc_url", req.getHeader("referer"));

        String save_id = CookieUtil.readCookie(req, "save_id");
        if (save_id != null) {
            model.addAttribute("save_id", save_id);
        }

        log.info("===============================");
    }

    @PostMapping("/login")
    public String loginPOST(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletRequest req,
            HttpServletResponse res) {

        log.info("===============================");
        log.info("LoginController >> loginPOST()");
        log.info("memberDTO : " + memberDTO.toString());

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/login";
        }

        MemberDTO loginMemberDTO = loginService.login_info(memberDTO.getUser_id(), memberDTO.getPwd());
        if (loginMemberDTO != null) {
            String save_id = req.getParameter("save_id");
            if (save_id != null && save_id.equals("on")) {
                CookieUtil.setCookie(res, "save_id", loginMemberDTO.getUser_id(), 60 * 60 * 24);
            } else {
                CookieUtil.removeCookie(res, "save_id");
            }

            MemberDTO dto = new MemberDTO();
            dto.setUser_id(loginMemberDTO.getUser_id());
            dto.setName(loginMemberDTO.getName());
            model.addAttribute("loginInfo", dto);

            HttpSession session = req.getSession();
            session.setAttribute("loginInfo", loginMemberDTO.getUser_id());

            return "redirect:/";
        } else {
            redirectAttributes.addFlashAttribute("err", "회원정보가 일치하지 않습니다.");
            return "redirect:/login/login";
        }
    }

    @GetMapping("/findPwd")
    public void findPwdGET(
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("LoginController >> findPwdGET()");


        log.info("===============================");
    }



}
