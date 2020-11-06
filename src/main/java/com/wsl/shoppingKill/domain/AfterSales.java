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
 * 售后记录表
 * @author wangshilei
 * @date 2020/11/4 16:39
 **/
@TableName("t_after_sales")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Accessors(chain = true)
public class AfterSales extends Model<AfterSales> implements Serializable {
    /**
    * id
    */
    @Id
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
    * 订单id
    */
    private String orderId;

    /**
    * 管理员id
    */
    private Long adminId;

    /**
    * 处理内容
    */
    private String detail;

    /**
    * 处理类型 （0-退货退款 1-换货 3-仅退款）
    */
    private Integer type;

    /**
    * 处理时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime dealTime;

    /**
    * 是否解决（0-未解决 1-已解决  默认0）
    */
    private Boolean result;

    /**
    * 创建时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime creatTime;

    /**
    * 更新时间
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
}