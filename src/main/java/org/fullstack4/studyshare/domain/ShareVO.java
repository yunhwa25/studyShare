package org.fullstack4.studyshare.domain;

import lombok.*;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShareVO {
    private int idx;
    private int bbs_idx;
    private String sender;
    private String receiver;
}