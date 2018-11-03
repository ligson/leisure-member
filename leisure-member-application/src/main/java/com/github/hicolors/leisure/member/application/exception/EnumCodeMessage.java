package com.github.hicolors.leisure.member.application.exception;

/**
 * EnumCodeMessage
 *
 * @author weichao.li (liweichao0102@gmail.com)
 * @date 2018/10/22
 */
public enum EnumCodeMessage {

    /**
     * member 服务全局错误异常码
     * <p>
     * 异常码示例：  100 000 001
     * <p>
     * <p>
     * 100 -> 前三位，代表服务（应用），不可更改。
     * <p>
     * 000 -> 中间三位，代表模块，公用，根据业务拆分模块。
     * <p>
     * 001 -> 后三位，代表具体异常码。
     */

    /********* 角色权限相关 *********/
    ROLE_NAME_EXIST(100001001L, "角色名称已存在"),
    PERMISSION_NAME_EXIST(100001002L, "权限名称已存在"),
    PERMISSION_STRATEGY_EXIST(100001003L, "权限策略已存在"),
    PERMISSION_STRATEGY_NON_EXIST(100001003L, "权限不存在"),

    /********* 平台相关 *********/
    PLATFORM_NAME_EXIST(100002001L, "平台信息名称已存在"),


    /********* 人员相关 *********/
    MEMBER_NON_EXIST(100003001L, "人员不存在"),
    MEMBER_MOBILE_EXIST(100003002L, "该手机号已存在"),
    MEMBER_EMAIL_EXIST(100003003L, "该邮箱已存在"),
    MEMBER_USERNAME_EXIST(100003004L, "该用户名已存在"),
    MEMBER_UNIQUE_KEY_NON_EXIST(100003005L, "该 [{0}] 对应的人员不存在"),

    MEMBER_USERNAME_PASSWORD_NON_EXIST(100003005L, "用户名密码不匹配"),

    ;

    private final Long code;

    private final String message;

    EnumCodeMessage(Long code, String message) {
        this.code = code;
        this.message = message;
    }

    public Long getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
