package org.fullstack4.studyshare.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.studyshare.domain.MemberVO;

public interface LoginMapper {
    MemberVO login_info(@Param("user_id") String id, @Param("pwd") String pwd);

    int update_login_data(@Param("user_id") String id, @Param("pwd") String pwd);
    int update_try_count(@Param("user_id") String id);
    int try_count(@Param("user_id") String id);

//    String search_id(@Param("name") String name, @Param("email") String email);
//    int search_pwd(@Param("name") String name, @Param("email") String email, @Param("member_id") String member_id);
//    int change_pwd(@Param("member_id") String member_id, @Param("pwd") String pwd);
}
