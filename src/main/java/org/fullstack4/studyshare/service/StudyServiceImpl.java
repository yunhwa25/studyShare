package org.fullstack4.studyshare.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.domain.StudyVO;
import org.fullstack4.studyshare.dto.PageRequestDTO;
import org.fullstack4.studyshare.dto.PageResponseDTO;
import org.fullstack4.studyshare.dto.StudyDTO;
import org.fullstack4.studyshare.mapper.StudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class StudyServiceImpl implements StudyServiceIf {
    private final StudyMapper studyMapper;
    private final ModelMapper modelMapper;

//    @Override
//    public int studyTotalCount(PageRequestDTO pageRequestDTO) {
//        return studyMapper.studyTotalCount(pageRequestDTO);
//    }
//
//    @Override
//    public PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO) {
//        List<StudyVO> voList = studyMapper.studyListByPage(pageRequestDTO);
//        List<StudyDTO> dtoList = voList.stream()
//                .map(vo -> modelMapper.map(vo, StudyDTO.class))
//                .collect(Collectors.toList());
//        int total_count = studyMapper.studyTotalCount(pageRequestDTO);
//
//        PageResponseDTO<StudyDTO> pageResponseDTO = PageResponseDTO.<StudyDTO>withAll()
//                .requestDTO(pageRequestDTO)
//                .dtoList(dtoList)
//                .total_count(total_count)
//                .build();
//
//        return pageResponseDTO;
//    }

    @Override
    public List<StudyDTO> studyList() {
        List<StudyVO> voList = studyMapper.studyList();

        List<StudyDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, StudyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }
}