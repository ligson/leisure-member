package com.github.life.lab.leisure.member.application.repository;

import com.github.life.lab.leisure.common.utils.JsonUtils;
import com.github.life.lab.leisure.member.application.entity.EMemberDetail;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
@ActiveProfiles("dev")
public class EMemberDetailRepositoryTest {

    @Autowired
    private EMemberDetailRepository repository;


}