package org.fullstack4.studyshare.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.domain.BbsVO;
import org.fullstack4.studyshare.domain.FileVO;
import org.fullstack4.studyshare.domain.ShareVO;
import org.fullstack4.studyshare.domain.StudyVO;
import org.fullstack4.studyshare.dto.*;
import org.fullstack4.studyshare.mapper.StudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class StudyServiceImpl implements StudyServiceIf {
    private final StudyMapper studyMapper;
    private final ModelMapper modelMapper;

    @Override
    public int studyTotalCount(PageRequestDTO pageRequestDTO) {
        return studyMapper.studyTotalCount(pageRequestDTO);
    }

    @Override
    public PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO) {
        List<StudyVO> voList = studyMapper.studyListByPage(pageRequestDTO);
        List<StudyDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, StudyDTO.class))
                .collect(Collectors.toList());
        int total_count = studyMapper.studyTotalCount(pageRequestDTO);

        PageResponseDTO<StudyDTO> pageResponseDTO = PageResponseDTO.<StudyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return pageResponseDTO;
    }

//    @Override
//    public List<StudyDTO> studyList(String writer) {
//        List<StudyVO> voList = studyMapper.studyList(writer);
//
//        List<StudyDTO> dtoList = voList.stream()
//                .map(vo -> modelMapper.map(vo, StudyDTO.class))
//                .collect(Collectors.toList());
//
//        return dtoList;
//    }

    @Override
    public Map<String, StudyDTO> studyView(int idx) {
        Map<String, StudyDTO> maps = new HashMap<>();

        StudyVO studyVO = studyMapper.studyView(idx);
        StudyDTO studyDTO = modelMapper.map(studyVO, StudyDTO.class);
        maps.put("studyDTO", studyDTO);

        return maps;
    }

//    @Override
//    public int studyRegist(StudyDTO studyDTO) {
//        StudyVO studyVO = modelMapper.map(studyDTO, StudyVO.class);
//        int result = studyMapper.studyRegist(studyVO);
//        return result;
//    }

    @Override
    public int bbsRegist(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        int result = studyMapper.bbsRegist(bbsVO);
        log.info(bbsVO.getIdx());
        return bbsVO.getIdx();
    }

    @Override
    public int fileRegist(FileDTO fileDTO) {
        FileVO fileVO = modelMapper.map(fileDTO, FileVO.class);
        int result = studyMapper.fileRegist(fileVO);
        return result;
    }

    @Override
    public int shareRegist(ShareDTO shareDTO) {
        ShareVO shareVO = modelMapper.map(shareDTO, ShareVO.class);
        int result = studyMapper.shareRegist(shareVO);
        return result;
    }

    @Override
    public int bbsModify(int idx) {
        return 0;
    }

    @Override
    public int fileModify(int idx) {
        return 0;
    }

    @Override
    public int shareModify(int idx) {
        return 0;
    }
}