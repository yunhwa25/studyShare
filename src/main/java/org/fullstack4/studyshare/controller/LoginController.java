package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.dto.MemberDTO;
import org.fullstack4.studyshare.service.LoginServiceIf;
import org.fullstack4.studyshare.utils.CookieUtil;
import org.fullstack4.studyshare.utils.DiffDateUtil;
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
import java.text.ParseException;


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
            HttpServletResponse res) throws ParseException {

        log.info("===============================");
        log.info("LoginController >> loginPOST()");
        log.info("memberDTO : " + memberDTO.toString());

        if (memberDTO.getUser_id() == null || memberDTO.getUser_id().isEmpty()) {
            redirectAttributes.addFlashAttribute("err", "아이디를 입력해주세요.");
            return "redirect:/login/login";
        } else if (memberDTO.getPwd() == null || memberDTO.getPwd().isEmpty()) {
            redirectAttributes.addAttribute("id", memberDTO.getUser_id());
            redirectAttributes.addFlashAttribute("err", "패스워드를 입력해주세요.");
            return "redirect:/login/login";
        }

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/login";
        }

        MemberDTO loginMemberDTO = loginService.login_info(memberDTO.getUser_id(), memberDTO.getPwd());
        if (loginMemberDTO != null) {
            String login_date = loginMemberDTO.getLogin_date().toString();
            int diffmonth = DiffDateUtil.diffDate(login_date);;
            if (diffmonth >= 6) {
                redirectAttributes.addFlashAttribute("err", "6개월 이상 로그인 이력이 없습니다. 관리자에게 문의해 주세요.");
                return "redirect:/login/login";
            }
            if (loginMemberDTO.getTry_count() >= 5) {
                redirectAttributes.addFlashAttribute("err", "5회 이상 로그인 실패로 잠금 처리된 아이디입니다. 관리자에게 문의해 주세요.");
                return "redirect:/login/login";
            }
            if (loginMemberDTO.getLimit_yn().equals("Y")) {
                redirectAttributes.addFlashAttribute("err", "관리자 또는 이용 규칙 위반에 의해 이용이 제한된 아이디입니다. 관리자에게 문의해 주세요.");
                return "redirect:/login/login";
            }


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

            // 로그인 이력 업데이트, 로그인 시도 횟수 리셋
            loginService.update_login_data(loginMemberDTO.getUser_id(), loginMemberDTO.getPwd());

            return "redirect:/";
        } else {
            // 로그인 시도 횟수 업데이트
            loginService.update_try_count(memberDTO.getUser_id());
            int try_count = loginService.try_count(memberDTO.getUser_id());
            redirectAttributes.addAttribute("try_count", try_count);
            redirectAttributes.addFlashAttribute("err", "입력하신 아이디 또는 패스워드가 일치하지 않습니다.");
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

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
