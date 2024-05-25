package org.fullstack4.studyshare.mapper;

import org.fullstack4.studyshare.domain.BbsVO;
import org.fullstack4.studyshare.domain.FileVO;
import org.fullstack4.studyshare.domain.ShareVO;
import org.fullstack4.studyshare.domain.StudyVO;
import org.fullstack4.studyshare.dto.PageRequestDTO;

import java.util.List;

public interface StudyMapper {

    // 페이징
    int studyTotalCount(PageRequestDTO pageRequestDTO);
    List<StudyVO> studyListByPage(PageRequestDTO pageRequestDTO);
//    List<StudyVO> studyListByPage2(PageRequestDTO pageRequestDTO);
//List<StudyVO> studyList(String writer);
    StudyVO studyView(int idx);

    int bbsRegist(BbsVO bbsVO);
    int fileRegist(FileVO fileVO);
    int shareRegist(ShareVO shareVO);
    int bbsModify(BbsVO bbsVO);
    int fileModify(FileVO fileVO);
    int shareModify(ShareVO shareVO);


//    StudyVO studyPrev(int idx);
//    StudyVO studyNext(int idx);
//
//    int studyDelete(int idx);
}
