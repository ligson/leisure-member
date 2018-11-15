package com.github.hicolors.leisure.member.sdk;

import com.github.hicolors.leisure.member.intf.PermissionApi;
import org.springframework.cloud.openfeign.FeignClient;

import static com.github.hicolors.leisure.member.sdk.config.LeisureMemberSdkConfiguration.CONTEXT_PATH;
import static com.github.hicolors.leisure.member.sdk.config.LeisureMemberSdkConfiguration.SERVER_NAME;

/**
 * PermissionClient
 *
 * @author weichao.li (liweichao0102@gmail.com)
 * @date 2018/11/5
 */
@FeignClient(name = SERVER_NAME, path = CONTEXT_PATH)
public interface PermissionClient extends PermissionApi {
}