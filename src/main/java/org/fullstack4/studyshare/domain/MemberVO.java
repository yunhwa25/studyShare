package org.fullstack4.studyshare.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private int idx;
    private String user_id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private LocalDate reg_date;
    private LocalDate login_date;
    private String lock_yn;
    private String limit_yn;
}
