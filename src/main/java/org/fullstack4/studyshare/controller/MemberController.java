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
