package org.fullstack4.studyshare.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.domain.MemberVO;
import org.fullstack4.studyshare.dto.MemberDTO;
import org.fullstack4.studyshare.mapper.LoginMapper;
import org.fullstack4.studyshare.utils.TempPasswordUtil;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;

@Log4j2
@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginServiceIf {
    private final LoginMapper loginMapper;
    private final ModelMapper modelMapper;
    @Override
    public MemberDTO login_info(String user_id, String pwd) {
        log.info("====================================");
        log.info("LoginServiceImpl >> login_info(user_id, pwd) : " + user_id + ", " + pwd);

        MemberVO memberVO = loginMapper.login_info(user_id, pwd);
        log.info("memberVO : " + memberVO);
        MemberDTO memberDTO = null;
        if (memberVO != null && (memberVO.getPwd().equals(pwd) || memberVO.getTmp_pwd().equals(pwd))) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            log.info("LoginServiceImpl >> login_info >> memberDTO: " + memberDTO);
        }

        log.info("memberDTO : " + memberDTO);
        return memberDTO;
    }

    @Override
    public int update_login_data(String user_id, String pwd) {
        return loginMapper.update_login_data(user_id, pwd);
    }

    @Override
    public int update_try_count(String user_id) {
        return loginMapper.update_try_count(user_id);
    }

    @Override
    public int try_count(String user_id) {
        return loginMapper.try_count(user_id);
    }

    @Override
    public int update_tmp_pwd(String user_id) {
        String tmp_pwd = TempPasswordUtil.makeTempPassword(4, 3, 1);
        return loginMapper.update_tmp_pwd(user_id, tmp_pwd);
    }

    @Override
    public String get_tmp_pwd(String user_id) {
        return loginMapper.get_tmp_pwd(user_id);
    }

    @Override
    public int reset_tmp_pwd(String user_id) {
        return loginMapper.reset_tmp_pwd(user_id);
    }

    @Override
    public int change_pwd(String user_id, String pwd) {

        log.info("====================================");
        log.info("LoginServiceImpl >> login_info(user_id, pwd) : " + user_id + ", " + pwd);

        MemberVO memberVO = loginMapper.login_info(user_id, pwd);
        log.info("memberVO : " + memberVO);
        MemberDTO memberDTO = null;
        if (memberVO != null && (memberVO.getPwd().equals(pwd) || memberVO.getTmp_pwd().equals(pwd))) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            log.info("LoginServiceImpl >> login_info >> memberDTO: " + memberDTO);
        }

        return loginMapper.change_pwd(user_id, pwd);
    }
}
