package org.fullstack4.studyshare.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LikeVO {
    private int idx;
    private int bbs_idx;
    private String user_id;
    private int like_cnt;
}