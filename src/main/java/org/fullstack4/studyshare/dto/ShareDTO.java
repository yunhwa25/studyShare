package org.fullstack4.studyshare.dto;

import lombok.*;

@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShareDTO {
    private int idx;
    private int bbs_idx;
    private String sender;
    private String receiver;
}