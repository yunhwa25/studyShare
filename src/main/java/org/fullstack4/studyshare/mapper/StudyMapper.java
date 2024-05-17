package org.fullstack4.studyshare.mapper;

import org.fullstack4.studyshare.domain.StudyVO;
import org.fullstack4.studyshare.dto.PageRequestDTO;

import java.util.List;

public interface StudyMapper {

    // 페이징
    int studyTotalCount(PageRequestDTO pageRequestDTO);
    List<StudyVO> studyListByPage(PageRequestDTO pageRequestDTO);
    List<StudyVO> studyListByPage2(PageRequestDTO pageRequestDTO, String writer);
    List<StudyVO> studyList(String writer);
    StudyVO studyView(int idx);
    int studyRegist(StudyVO studyVO);

//    StudyVO studyPrev(int idx);
//    StudyVO studyNext(int idx);
//
//    int studyModify(StudyVO studyVO);
//    int studyDelete(int idx);
}
