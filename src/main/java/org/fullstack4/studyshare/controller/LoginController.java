package org.fullstack4.studyshare.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


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
//
//        String save_id = CookieUtil.readCookie(req, "save_id");
//        if (save_id != null) {
//            model.addAttribute("save_id", save_id);
//        }
//
//        HttpSession session = req.getSession();
//        String auto_login = CookieUtil.readCookie(req, "auto_login");
//        if (auto_login != null) {
//            session.setAttribute("loginInfo", auto_login);
//        }

        log.info("===============================");
    }
}
