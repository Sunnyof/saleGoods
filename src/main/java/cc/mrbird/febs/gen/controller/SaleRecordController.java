package cc.mrbird.febs.gen.controller;

import cc.mrbird.febs.common.annotation.ControllerEndpoint;
import cc.mrbird.febs.common.utils.FebsUtil;
import cc.mrbird.febs.common.entity.FebsConstant;
import cc.mrbird.febs.common.controller.BaseController;
import cc.mrbird.febs.common.entity.FebsResponse;
import cc.mrbird.febs.common.entity.QueryRequest;
import cc.mrbird.febs.gen.entity.SaleRecord;
import cc.mrbird.febs.gen.entity.dto.SaleRecordDTO;
import cc.mrbird.febs.gen.service.ISaleRecordService;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * Controller
 *
 * @author MrBird
 * @date 2021-02-05 15:35:48
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class SaleRecordController extends BaseController {

    @Autowired
    ISaleRecordService saleRecordService;

    @GetMapping(FebsConstant.VIEW_PREFIX + "saleRecord")
    @RequiresPermissions("saleRecord:list")
    public String saleRecordIndex() {
        return FebsUtil.view("saleRecord/saleRecord");
    }

    @GetMapping(FebsConstant.VIEW_PREFIX + "saleRecordTotal")
    @RequiresPermissions("saleRecord:total:list")
    public String saleRecordToalIndex() {
        return FebsUtil.view("saleRecord/saleRecordTotal");
    }

    @GetMapping("saleRecord")
    @ResponseBody
    @RequiresPermissions("saleRecord:list")
    public FebsResponse getAllSaleRecords(SaleRecord saleRecord) {
        return new FebsResponse().success().data(saleRecordService.findSaleRecords(saleRecord));
    }

    @GetMapping("saleRecord/list")
    @ResponseBody
    @RequiresPermissions("saleRecord:list")
    public FebsResponse saleRecordList(QueryRequest request, SaleRecordDTO saleRecordDTO) {
        Map<String, Object> dataTable = getDataTable(this.saleRecordService.findSaleRecords(request, saleRecordDTO));
        return new FebsResponse().success().data(dataTable);
    }

    @GetMapping("saleRecord/total/list")
    @ResponseBody
    @RequiresPermissions("saleRecord:total:list")
    public FebsResponse saleRecordTotalList(QueryRequest request,SaleRecordDTO saleRecordDTO){
        Map<String,Object> dataTable = getDataTable(this.saleRecordService.listSaleRecords(request,saleRecordDTO));
        return new FebsResponse().success().data(dataTable);
    }
    @ControllerEndpoint(operation = "新增SaleRecord", exceptionMessage = "新增SaleRecord失败")
    @PostMapping("saleRecord")
    @ResponseBody
    @RequiresPermissions("saleRecord:add")
    public FebsResponse addSaleRecord(@Valid SaleRecord saleRecord) {
        this.saleRecordService.createSaleRecord(saleRecord);
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "删除SaleRecord", exceptionMessage = "删除SaleRecord失败")
    @GetMapping("saleRecord/delete")
    @ResponseBody
    @RequiresPermissions("saleRecord:delete")
    public FebsResponse deleteSaleRecord(SaleRecord saleRecord) {
        this.saleRecordService.deleteSaleRecord(saleRecord);
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "修改SaleRecord", exceptionMessage = "修改SaleRecord失败")
    @PostMapping("saleRecord/update")
    @ResponseBody
    @RequiresPermissions("saleRecord:update")
    public FebsResponse updateSaleRecord(SaleRecord saleRecord) {
        this.saleRecordService.updateSaleRecord(saleRecord);
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "修改SaleRecord", exceptionMessage = "导出Excel失败")
    @PostMapping("saleRecord/excel")
    @ResponseBody
    @RequiresPermissions("saleRecord:export")
    public void export(QueryRequest queryRequest, SaleRecordDTO saleRecord, HttpServletResponse response) {
        List<SaleRecord> saleRecords = this.saleRecordService.findSaleRecords(queryRequest, saleRecord).getRecords();
        ExcelKit.$Export(SaleRecord.class, response).downXlsx(saleRecords, false);
    }
}
