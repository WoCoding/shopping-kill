package com.wsl.shoppingkill.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wsl.shoppingkill.domain.Goods;
import com.wsl.shoppingkill.obj.vo.BaseVO;
import com.wsl.shoppingkill.obj.vo.GoodsVO;

import java.util.List;

/**
 * @author wangShilei
 */
public interface GoodsService extends IService<Goods> {

    /**
     * 添加一条商品
     * @author wangShilei
     * @date 2020/11/19 10:12 下午
     * @param goods :
     * @return boolean
     * @throws Exception:
     */
    boolean addGoods(Goods goods) throws Exception;

    /**
     * 获取全部商品列表
     * @param current :
     * @param size :
     * @param goods :
     * @return IPage<Goods>
     * @author : WangShiLei
     * @date : 2020/11/19 9:55 上午
     **/
    IPage<GoodsVO> getGoodsAll(Long current, Long size,Goods goods);

    /**
     * 商品上架处理
     * @author wangShilei
     * @date 2020/11/19 10:12 上午
     * @param id :
     * @return boolean
     */
    String merchandise(Long id);

    /**
     * 更新商品
     * @author wangShilei
     * @date 2020/11/19 10:15 上午
     * @param goods :
     * @return boolean
     * @throws Exception :
     */
    boolean updateGoods(Goods goods) throws Exception;

    /**
     * 根据ID商品某个商品
     * @author wangShilei
     * @date 2020/11/19 10:19 上午
     * @param id :
     * @return boolean
     */
    boolean delGoods(Long id);

    /**
     * 获取所有物品名称
     * @author wangShilei
     * @date 2020/12/16 9:45
     * @return List<Object>
     */
    List<BaseVO> getGoodsNameAll();

}
