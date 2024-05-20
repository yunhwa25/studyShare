package org.fullstack4.studyshare.dto;

import lombok.*;

@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LikeDTO {
    private int idx;
    private int bbs_idx;
    private String user_id;
    private int like_cnt;
}