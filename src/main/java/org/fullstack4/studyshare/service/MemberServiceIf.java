package org.fullstack4.studyshare.service;

import org.fullstack4.studyshare.dto.MemberDTO;

public interface MemberServiceIf {
//    int join(MemberDTO memberDTO);

    MemberDTO view(String user_id);
    int modify(MemberDTO memberDTO);
    int leave(String user_id);
}
