package com.wsl.shoppingKill.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Id;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 *
 * 用户表
 * @author wangshilei
 * @date 2020/11/4 16:46
 **/
@TableName("t_user")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Accessors(chain = true)
public class User extends Model<User> implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
    * id
    */
    @Id
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
    * 账号
    */
    private String name;

    /**
    * 密码
    */
    private String password;

    /**
    * 昵称
    */
    private String nickName;

    /**
    * 头像
    */
    private String img;

    /**
    * 性别
    */
    private String sex;

    /**
    * 个性签名
    */
    private String signature;

    /**
    * 手机号
    */
    private String phone;

    /**
    * 邮箱
    */
    private String email;

    /**
    * 身份证号
    */
    private String idCard;

    /**
    * 真实姓名
    */
    private String realName;

    /**
    * 微信
    */
    private String weChat;

    /**
    * 支付宝（暂时不用）
    */
    private String apply;

    /**
    * 创建时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime creatTime;

    /**
    * 跟新时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
    * 是否删除
    */
    @TableLogic
    private Boolean delFlag;




    public static final String ID = "id";

    public static final String NAME = "name";

    public static final String PASSWORD = "password";

    public static final String NICK_NAME = "nick_name";

    public static final String IMG = "img";

    public static final String SEX = "sex";

    public static final String SIGNATURE = "signature";

    public static final String PHONE = "phone";

    public static final String EMAIL = "email";

    public static final String ID_CARD = "id_card";

    public static final String REAL_NAME = "real_name";

    public static final String WE_CHAT = "we_chat";

    public static final String APPLY = "apply";

    public static final String CREAT_TIME = "creat_time";

    public static final String UPDATE_TIME = "update_time";

    public static final String DEL_FLAG = "del_flag";
}