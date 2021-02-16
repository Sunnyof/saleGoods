package cc.mrbird.febs.gen.service.impl;

import cc.mrbird.febs.common.entity.QueryRequest;
import cc.mrbird.febs.common.utils.FebsUtil;
import cc.mrbird.febs.gen.entity.Category;
import cc.mrbird.febs.gen.mapper.CategoryMapper;
import cc.mrbird.febs.gen.service.ICategoryService;
import cc.mrbird.febs.system.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.internal.properties.javabean.JavaBeanHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.Date;
import java.util.List;

/**
 * Service实现
 *
 * @author MrBird
 * @date 2021-02-05 09:47:59
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {

    private final CategoryMapper categoryMapper;

    @Override
    public IPage<Category> findCategorys(QueryRequest request, Category category) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(category.getCategoryCode())) {
            queryWrapper.like(Category::getCategoryCode, category.getCategoryCode());
        }
        if(StringUtils.isNotBlank(category.getName())){
            queryWrapper.like(Category::getName,category.getName());
        }
        // TODO 设置查询条件
        Page<Category> page = new Page<>(request.getPageNum(), request.getPageSize());
        return this.page(page, queryWrapper);
    }

    @Override
    public List<Category> findCategorys(Category category) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createCategory(Category category) {
        User user = FebsUtil.getCurrentUser();
        category.setCreateTime(new Date());
        category.setCreatorId(user.getUserId());
        category.setCreatorName(user.getUsername());
        this.save(category);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateCategory(Category category) {
        this.saveOrUpdate(category);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteCategory(Category category) {
//        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
        removeById(category.getId());
//        // TODO 设置删除条件
//        this.remove(wrapper);
    }
}
