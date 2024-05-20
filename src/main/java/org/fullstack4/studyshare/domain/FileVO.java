package org.fullstack4.studyshare.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileVO {
    private int idx;
    private int bbs_idx;
    private String org_file_name;
    private String save_file_name;
    private int file_size;
    private String file_type;
}