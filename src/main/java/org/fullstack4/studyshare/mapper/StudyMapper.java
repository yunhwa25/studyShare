package org.fullstack4.studyshare.mapper;

import org.fullstack4.studyshare.domain.StudyVO;
import org.fullstack4.studyshare.dto.PageRequestDTO;

import java.util.List;

public interface StudyMapper {

    // 페이징
//    int studyTotalCount(PageRequestDTO pageRequestDTO);
//    List<StudyVO> studyListByPage(PageRequestDTO pageRequestDTO);
    List<StudyVO> studyList();
//    StudyVO studyView(int idx);
//    StudyVO studyPrev(int idx);
//    StudyVO studyNext(int idx);
//
//    int studyRegist(StudyVO studyVO);
//    int studyModify(StudyVO studyVO);
//    int studyDelete(int idx);
}
