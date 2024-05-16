package org.fullstack4.studyshare.service;


import org.fullstack4.studyshare.dto.PageRequestDTO;
import org.fullstack4.studyshare.dto.PageResponseDTO;
import org.fullstack4.studyshare.dto.StudyDTO;

import java.util.List;

public interface StudyServiceIf {
//    int studyTotalCount(PageRequestDTO pageRequestDTO);
//    PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO);
    List<StudyDTO> studyList();

//    int studyRegist(StudyDTO dataDTO);
//    Map<String, StudyDTO> studyView(int idx);
//    StudyDTO studyModifyGet(int idx);
//    int studyModify(StudyDTO dataDTO);
//    int studyDelete(int idx);
}
