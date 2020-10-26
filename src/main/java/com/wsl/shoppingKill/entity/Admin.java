package com.wsl.shoppingKill.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wsl
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Admin implements Serializable {
    /**
    * id
    */
    private Long id;

    /**
    * 用户名
    */
    private String username;

    /**
    * 密码 md5加密存储
    */
    private String password;

    /**
    * 注册手机号
    */
    private String phone;

    /**
    * 微信号
    */
    private String wx;

    /**
    * 性别
    */
    private String sex;

    /**
    * 地址
    */
    private String address;

    /**
    * 头像
    */
    private String img;

    /**
    * 类型: 1-管理员  2-员工
    */
    private Integer type;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 更新时间
    */
    private Date updateTime;

    /**
    * 是否离职 0-离职 1-在职
    */
    private byte[] state;

    private static final long serialVersionUID = 1L;
}