package org.fullstack4.studyshare.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StudyVO {
    private int idx;
    private String writer;
    private String title;
    private String content;
    private String org_file_name;
    private String save_file_name;
    private String category;
    private String hashtag;
    private int like;
    private String sharer;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private LocalDate display_start;
    private LocalDate display_end;
}