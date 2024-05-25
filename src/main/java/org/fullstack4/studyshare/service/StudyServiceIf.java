package org.fullstack4.studyshare.service;


import org.fullstack4.studyshare.domain.StudyVO;
import org.fullstack4.studyshare.dto.*;

import java.util.List;
import java.util.Map;

public interface StudyServiceIf {
    int studyTotalCount(PageRequestDTO pageRequestDTO);
    PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO);
//    List<StudyDTO> studyList(String writer);
    Map<String, StudyDTO> studyView(int idx);

    int bbsRegist(BbsDTO bbsDTO);
    int fileRegist(FileDTO fileDTO);
    int shareRegist(ShareDTO shareDTO);

    int bbsModify(int idx);
    int fileModify(int idx);
    int shareModify(int idx);


//    StudyDTO studyModifyGet(int idx);
//    int studyModify(StudyDTO dataDTO);
//    int studyDelete(int idx);
}
