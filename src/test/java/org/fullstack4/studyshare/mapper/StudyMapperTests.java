package org.fullstack4.studyshare.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.studyshare.domain.StudyVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:/studySharePrj/studyShare/src/main/webapp/WEB-INF/root-context.xml")
public class StudyMapperTests {

    @Autowired(required = false)
    private StudyMapper studyMapper;

    @Test
    public void testList() {
        List<StudyVO> studyList = studyMapper.studyList("test");
        studyList.forEach(list -> log.info(list));
    }
}
