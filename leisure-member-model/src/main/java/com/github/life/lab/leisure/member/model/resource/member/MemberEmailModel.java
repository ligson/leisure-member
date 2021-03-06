package com.github.life.lab.leisure.member.model.resource.member;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * MemberUsernameModel
 *
 * @author weichao.li (liweichao0102@gmail.com)
 * @date 2018/10/24
 */

@ApiModel("人员邮箱 model")
@Data
public class MemberEmailModel {

    @ApiModelProperty(notes = "新邮箱", required = true)
    @NotBlank(message = "新邮箱不允许为空")
    @Length(min = 3, max = 50, message = "新邮箱长度不合法")
    private String email;

}
