package org.fullstack4.studyshare.mapper;

import org.fullstack4.studyshare.domain.MemberVO;

public interface MemberMapper {
//    int join(MemberVO memberVO);
//
    MemberVO view(String user_id);
    int modify(MemberVO memberVO);
    int leave(String user_id);
}
