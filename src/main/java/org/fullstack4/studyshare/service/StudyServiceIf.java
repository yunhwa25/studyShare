package org.fullstack4.studyshare.service;


import org.fullstack4.studyshare.dto.PageRequestDTO;
import org.fullstack4.studyshare.dto.PageResponseDTO;
import org.fullstack4.studyshare.dto.StudyDTO;

import java.util.List;

public interface StudyServiceIf {
    int studyTotalCount(PageRequestDTO pageRequestDTO);
    PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<StudyDTO> studyListByPage2(PageRequestDTO pageRequestDTO, String writer);
    List<StudyDTO> studyList(String writer);
    StudyDTO studyView(int idx);
    int studyRegist(StudyDTO studyDTO);


//    Map<String, StudyDTO> studyView(int idx);
//    StudyDTO studyModifyGet(int idx);
//    int studyModify(StudyDTO dataDTO);
//    int studyDelete(int idx);
}
