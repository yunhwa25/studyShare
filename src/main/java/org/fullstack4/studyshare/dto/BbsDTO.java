package org.fullstack4.studyshare.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    private int idx;
    private String writer;
    private String title;
    private String content;
    private String category;
    private String hashtag;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private LocalDate display_start;
    private LocalDate display_end;
    private String display_yn;
    private int like_cnt;
}