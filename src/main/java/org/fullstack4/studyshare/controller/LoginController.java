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
import java.io.IOException;
import java.io.PrintWriter;
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
            HttpServletResponse res) throws ParseException, NullPointerException {

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

            // 로그인 시도 횟수 업데이트
            loginService.update_try_count(memberDTO.getUser_id());
            int try_count = loginService.try_count(memberDTO.getUser_id());
            redirectAttributes.addAttribute("try_count", try_count);
            redirectAttributes.addFlashAttribute("err", "입력하신 아이디 또는 패스워드가 일치하지 않습니다.");
            return "redirect:/login/login";
        }

        MemberDTO loginMemberDTO = loginService.login_info(memberDTO.getUser_id(), memberDTO.getPwd());
        log.info("loginMemberDTO : " + loginMemberDTO);
        if (loginMemberDTO != null) {
            String login_date = loginMemberDTO.getLogin_date().toString();
            int diffmonth = DiffDateUtil.diffDate(login_date);
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

            if (loginMemberDTO.getTmp_pwd() != null && !loginMemberDTO.getTmp_pwd().isEmpty()) {
                redirectAttributes.addAttribute("user_id", loginMemberDTO.getUser_id());
                return "redirect:/login/modifyPwd";
            }

            return "redirect:/";

        }

        else {
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

    @PostMapping("/findPwd")
    public String findPwdPOST(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {

        if (memberDTO.getUser_id() == null || memberDTO.getUser_id().isEmpty()) {
            redirectAttributes.addFlashAttribute("err", "아이디를 입력해주세요.");
            return "redirect:/login/findPwd";
        }

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/findPwd";
        }

        int result = loginService.update_tmp_pwd(memberDTO.getUser_id());
        if (result > 0) {
            String tmp_pwd = loginService.get_tmp_pwd(memberDTO.getUser_id());
            redirectAttributes.addAttribute("tmp_pwd", tmp_pwd);
            return "redirect:/login/findPwdSuccess?id=" + memberDTO.getUser_id();
        } else {
            redirectAttributes.addFlashAttribute("err", "일치하는 아이디가 없습니다.");
            return "redirect:/login/findPwd";
        }
    }

    @GetMapping("/findPwdSuccess")
    public void findPwdSuccessGET(
            @RequestParam(name = "id", defaultValue = "") String id,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("LoginController >> findPwdSuccessGET()");
        redirectAttributes.addAttribute("id", id);
        log.info("===============================");
    }

    @GetMapping("/modifyPwd")
    public void modifyPwdGET(
            Model model,
            @RequestParam(name = "user_id", defaultValue = "") String user_id
    ) {
        log.info("===============================");
        log.info("LoginController >> modifyPwdGET()");
        model.addAttribute("user_id", user_id);
        log.info("===============================");
    }

    @PostMapping("/modifyPwd")
    public String modifyPwdPOST(
            @Valid MemberDTO memberDTO,
            @RequestParam(name="past_pwd", defaultValue = "") String past_pwd,
            HttpServletResponse resp,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) throws IOException {
        log.info("===============================");
        log.info("LoginController >> modifyPwdPOST()");
        log.info("memberDTO : " + memberDTO);
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            log.info("에러!!");
            return "redirect:/login/modifyPwd";
        }

        int result = loginService.change_pwd(memberDTO.getUser_id(), memberDTO.getPwd());
        if (result > 0) {
            // 임시 비밀번호 리셋
            loginService.reset_tmp_pwd(memberDTO.getUser_id());
            out.println("<script>alert('패스워드가 정상적으로 변경되었습니다.'); window.location.href='/';</script>");
            out.close();
            return "redirect:/";
        } else {
            out.close();
            redirectAttributes.addFlashAttribute("err", "기존과 동일한 패스워드는 사용할 수 없습니다.");
            return "/login/modifyPwd";
        }
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
