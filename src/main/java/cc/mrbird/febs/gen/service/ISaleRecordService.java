package cc.mrbird.febs.gen.service;

import cc.mrbird.febs.gen.entity.SaleRecord;

import cc.mrbird.febs.common.entity.QueryRequest;
import cc.mrbird.febs.gen.entity.dto.SaleRecordDTO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 *  Service接口
 *
 * @author MrBird
 * @date 2021-02-05 15:35:48
 */
public interface ISaleRecordService extends IService<SaleRecord> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param saleRecord saleRecord
     * @return IPage<SaleRecord>
     */
    IPage<SaleRecord> findSaleRecords(QueryRequest request, SaleRecordDTO saleRecord);

    /**
     * 查询统计（分页）
     *
     * @param request QueryRequest
     * @param saleRecord saleRecord
     * @return IPage<SaleRecord>
     */
    IPage<SaleRecord> listSaleRecords(QueryRequest request, SaleRecordDTO saleRecord);


    /**
     * 查询（所有）
     *
     * @param saleRecord saleRecord
     * @return List<SaleRecord>
     */
    List<SaleRecord> findSaleRecords(SaleRecord saleRecord);

    /**
     * 新增
     *
     * @param saleRecord saleRecord
     */
    void createSaleRecord(SaleRecord saleRecord);

    /**
     * 修改
     *
     * @param saleRecord saleRecord
     */
    void updateSaleRecord(SaleRecord saleRecord);

    /**
     * 删除
     *
     * @param saleRecord saleRecord
     */
    void deleteSaleRecord(SaleRecord saleRecord);
}
