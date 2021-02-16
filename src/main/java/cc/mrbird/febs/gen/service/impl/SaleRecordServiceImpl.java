package cc.mrbird.febs.gen.service.impl;

import cc.mrbird.febs.common.entity.QueryRequest;
import cc.mrbird.febs.common.utils.FebsUtil;
import cc.mrbird.febs.gen.entity.Category;
import cc.mrbird.febs.gen.entity.SaleRecord;
import cc.mrbird.febs.gen.entity.dto.SaleRecordDTO;
import cc.mrbird.febs.gen.mapper.CategoryMapper;
import cc.mrbird.febs.gen.mapper.SaleRecordMapper;
import cc.mrbird.febs.gen.service.ICategoryService;
import cc.mrbird.febs.gen.service.ISaleRecordService;
import cc.mrbird.febs.system.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

/**
 * Service实现
 *
 * @author MrBird
 * @date 2021-02-05 15:35:48
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SaleRecordServiceImpl extends ServiceImpl<SaleRecordMapper, SaleRecord> implements ISaleRecordService {
    @Autowired
    ICategoryService categoryService;

    @Override
    public IPage<SaleRecord> findSaleRecords(QueryRequest request, SaleRecordDTO saleRecord) {
        LambdaQueryWrapper<SaleRecord> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(saleRecord.getCategoryName())) {
            queryWrapper.like(SaleRecord::getCategoryName, saleRecord.getCategoryName());
        }
        if (StringUtils.isNotBlank(saleRecord.getCollectionStartDate())) {
            queryWrapper.ge(SaleRecord::getCollectionDate, saleRecord.getCollectionStartDate());
        }
        if (StringUtils.isNotBlank(saleRecord.getCollectionEndDate())) {
            queryWrapper.le(SaleRecord::getCollectionDate, saleRecord.getCollectionEndDate());
        }
        // TODO 设置查询条件
        Page<SaleRecord> page = new Page<SaleRecord>(request.getPageNum(), request.getPageSize());
        return this.page(page, queryWrapper);
    }

    @Override
    public IPage<SaleRecord> listSaleRecords(QueryRequest request, SaleRecordDTO saleRecord) {
        QueryWrapper<SaleRecord> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(saleRecord.getCategoryName())) {
            queryWrapper.like("category_name", saleRecord.getCategoryName());
        }
        if (StringUtils.isNotBlank(saleRecord.getCollectionStartDate())) {
            queryWrapper.ge("collection_date", saleRecord.getCollectionStartDate());
        }
        if (StringUtils.isNotBlank(saleRecord.getCollectionEndDate())) {
            queryWrapper.le("collection_date", saleRecord.getCollectionEndDate());
        }
        Page<SaleRecord> page = new Page<SaleRecord>(request.getPageNum(), request.getPageSize());
       List<SaleRecord> saleRecords =  baseMapper.listSaleRecordTotal(queryWrapper);
       page.setRecords(saleRecords);
        return page;
    }

    @Override
    public List<SaleRecord> findSaleRecords(SaleRecord saleRecord) {
        LambdaQueryWrapper<SaleRecord> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createSaleRecord(SaleRecord saleRecord) {
        User user = FebsUtil.getCurrentUser();
        saleRecord.setCreateTime(new Date());
        saleRecord.setCreatorId(user.getUserId());
        saleRecord.setCreatorName(user.getUsername());
        Category category = categoryService.getById(saleRecord.getCategoryId());
        saleRecord.setCategoryName(category.getName());
        saleRecord.setCollectionDate(new Date());
        this.save(saleRecord);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSaleRecord(SaleRecord saleRecord) {
       User user = FebsUtil.getCurrentUser();
       saleRecord.setCreateTime(new Date());
       saleRecord.setCreatorId(user.getUserId());
        this.saveOrUpdate(saleRecord);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSaleRecord(SaleRecord saleRecord) {
        // TODO 设置删除条件
        this.removeById(saleRecord.getId());
    }
}
