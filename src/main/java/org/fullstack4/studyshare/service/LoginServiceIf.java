package org.fullstack4.studyshare.service;

import org.fullstack4.studyshare.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO  login_info(String user_id, String pwd);
}
