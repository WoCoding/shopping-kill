package com.wsl.shoppingKill.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wsl.shoppingKill.common.log.MyLog;
import com.wsl.shoppingKill.constant.LoggerEnum;
import com.wsl.shoppingKill.domain.Admin;
import com.wsl.shoppingKill.mapper.AdminMapper;
import com.wsl.shoppingKill.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author WangShilei
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService{

    @Resource
    private AdminMapper adminMapper;


    @Override
    @MyLog(detail = "添加管理员",grade = LoggerEnum.SERIOUS,value = "#admin.name")
    public boolean addAdmin(Admin admin) {
        return adminMapper.insert(admin)>0;
    }

    @Override
    @MyLog(detail = "修改管理员信息",grade = LoggerEnum.WORN,value = "#admin.name")
    public boolean updateAdmin(Admin admin) {
        return adminMapper.updateById(admin)>0;
    }

    @Override
    @MyLog(detail = "删除管理员",grade = LoggerEnum.SERIOUS,value = "#id")
    public boolean delAdmin(Long id) {
        return adminMapper.deleteById(id)>0;
    }


    @Override
    public List<Admin> getAdminList() {
        return adminMapper.selectList(new QueryWrapper<>());
    }
}
