package org.fullstack4.studyshare.dto;

import lombok.*;

@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileDTO {
    private int idx;
    private int bbs_idx;
    private String org_file_name;
    private String save_file_name;
    private int file_size;
    private String file_type;
}