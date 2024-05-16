package org.fullstack4.studyshare.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;
import java.util.Arrays;

@Log4j2
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int total_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int first_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_size=10;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int total_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_size=5;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_start=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_end=1;

    private String[] search_type;
    private String search_word;
    private String search_date1;
    private String search_date2;

    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }
    public int getPage_skip_count() {
        return (this.page-1)*this.page_size;
    }

    public boolean checkType(String type) {
        if (search_type == null || search_type.length == 0) {
            return false;
        }
        return Arrays.stream(search_type).anyMatch(type::equals);
    }
}
