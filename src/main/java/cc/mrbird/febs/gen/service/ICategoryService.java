package cc.mrbird.febs.gen.service;

import cc.mrbird.febs.gen.entity.Category;

import cc.mrbird.febs.common.entity.QueryRequest;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 *  Service接口
 *
 * @author MrBird
 * @date 2021-02-05 09:47:59
 */
public interface ICategoryService extends IService<Category> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param category category
     * @return IPage<Category>
     */
    IPage<Category> findCategorys(QueryRequest request, Category category);

    /**
     * 查询（所有）
     *
     * @param category category
     * @return List<Category>
     */
    List<Category> findCategorys(Category category);

    /**
     * 新增
     *
     * @param category category
     */
    void createCategory(Category category);

    /**
     * 修改
     *
     * @param category category
     */
    void updateCategory(Category category);

    /**
     * 删除
     *
     * @param category category
     */
    void deleteCategory(Category category);
}
