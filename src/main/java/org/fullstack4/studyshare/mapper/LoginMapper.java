package org.fullstack4.studyshare.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.studyshare.domain.MemberVO;

public interface LoginMapper {
    MemberVO login_info(@Param("user_id") String id, @Param("pwd") String pwd);
}
