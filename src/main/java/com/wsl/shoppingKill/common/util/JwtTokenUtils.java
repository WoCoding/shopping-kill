package com.wsl.shoppingKill.common.util;

import com.wsl.shoppingKill.constant.JwtEnum;
import com.wsl.shoppingKill.obj.bo.UserBO;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.joda.time.DateTime;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import java.util.Date;

/**
 * @author WangShilei
 * @date 2020/11/23-10:41
 **/
public class JwtTokenUtils {

    private static Integer expire = 360;

    private static Key getKeyInstance(){
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        byte[] bytes = DatatypeConverter.parseBase64Binary("mall-user");
        return new SecretKeySpec(bytes,signatureAlgorithm.getJcaName());
    }

    /**
     * 生成token的方法
     * @param userBO :
     * @return String
     */
    public static String getToken(UserBO userBO){
        return Jwts.builder()
                .claim(JwtEnum.KEY_USER_ID,userBO.getId())
                .claim(JwtEnum.KEY_USER_FLAG,userBO.getFlag())
                .setExpiration(DateTime.now().plusSeconds(expire).toDate())
                .signWith(SignatureAlgorithm.HS256,getKeyInstance()).compact();

    }

    /**
     * 根据token获取token中的信息
     * @param token:
     * @return JwtInfo:
     */
    public static UserBO getTokenInfo(String token){
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(getKeyInstance()).parseClaimsJws(token);
        Claims claims = claimsJws.getBody();
        UserBO userBO = new UserBO();
        userBO.setId(Long.parseLong(claims.get(JwtEnum.KEY_USER_ID).toString()))
                .setFlag(Integer.parseInt(claims.get(JwtEnum.KEY_USER_FLAG).toString()));
        return userBO;
    }

    public static Long getTokenTime(String token){
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(getKeyInstance()).parseClaimsJws(token);
        Claims claims = claimsJws.getBody();
        System.out.println(claims.getExpiration());
       return DateUtil.distanceSecond(new Date(),claims.getExpiration());
    }
}
