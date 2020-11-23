package com.wsl.shoppingKill.component.request;

import com.wsl.shoppingKill.common.util.JwtTokenUtils;
import com.wsl.shoppingKill.constant.JwtEnum;
import com.wsl.shoppingKill.constant.RedisEnum;
import com.wsl.shoppingKill.obj.bo.UserBO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Profile;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * 线上获取当前登录用户信息
 * @author wsl
 */
@Slf4j
@Component
@Profile({"pro"})
public class ProdAbstractCurrentRequestComponent extends AbstractCurrentRequestComponent {


    @Resource
    private RedisTemplate<String,UserBO> redisTemplate;
    /**
     * 获取当前登陆用户信息
     * @return 当前登录用户信息
     */
    @Override
    public UserBO getCurrentUser() {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        String token = request.getHeader(JwtEnum.AUTH_HEADER_KEY);
        if (StringUtils.isBlank(token) ) {
            return null;
        }
        try {
            return JwtTokenUtils.getTokenInfo(token.substring(JwtEnum.TOKEN_PREFIX.length()));
        }catch (Exception e){
            UserBO userBO = redisTemplate.opsForValue().get(RedisEnum.VERIFY_TOKEN+token);
            if (Objects.nonNull(userBO)){
                return userBO;
            }

            log.info("获取用户信息失败"+e.getMessage());
        }

        return null;
    }
}
