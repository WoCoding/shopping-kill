package com.wsl.shoppingkill.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wsl.shoppingkill.domain.Activity;
import com.wsl.shoppingkill.obj.param.ActivityParam;
import com.wsl.shoppingkill.obj.vo.ActivityVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author wangShilei
 */
@Mapper
public interface ActivityMapper extends BaseMapper<Activity> {

   /**
    * 获取秒杀活动列表详情
    * @author wangShilei
    * @date 2020/11/29 9:58 下午
    * @param page :
    * @param activityParam : status:1-未开始 2-进行中 3-已结束
    * @return IPage<com.wsl.shoppingkill.obj.vo.ActivityVO>
    */
   IPage<ActivityVO> getActivityAll(Page<ActivityVO> page, @Param("activity") ActivityParam activityParam);
}