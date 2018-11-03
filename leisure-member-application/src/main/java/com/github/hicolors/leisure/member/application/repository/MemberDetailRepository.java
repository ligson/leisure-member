package com.github.hicolors.leisure.member.application.repository;

import com.github.hicolors.leisure.common.jpa.customiz.repository.ColorsRepository;
import com.github.hicolors.leisure.member.model.persistence.MemberDetail;
import org.springframework.stereotype.Repository;

/**
 * MemberDetailRepository
 *
 * @author weichao.li (liweichao0102@gmail.com)
 * @date 2018/10/2
 */
@Repository
public interface MemberDetailRepository extends ColorsRepository<MemberDetail, Long> {

    MemberDetail findByMobile(String mobile);

    MemberDetail findByEmail(String mobile);

}