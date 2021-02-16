package cc.mrbird.febs.gen.controller;

import cc.mrbird.febs.common.annotation.ControllerEndpoint;
import cc.mrbird.febs.common.utils.FebsUtil;
import cc.mrbird.febs.common.entity.FebsConstant;
import cc.mrbird.febs.common.controller.BaseController;
import cc.mrbird.febs.common.entity.FebsResponse;
import cc.mrbird.febs.common.entity.QueryRequest;
import cc.mrbird.febs.gen.entity.Category;
import cc.mrbird.febs.gen.service.ICategoryService;
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
 * @date 2021-02-05 09:47:59
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class CategoryController extends BaseController {

    @Autowired
    ICategoryService categoryService;

    @GetMapping(FebsConstant.VIEW_PREFIX + "category")
    @RequiresPermissions("category:list")
    public String categoryIndex() {
        return FebsUtil.view("category/category");
    }

    @GetMapping("category")
    @ResponseBody
    @RequiresPermissions("category:list")
    public FebsResponse getAllCategorys(Category category) {
        return new FebsResponse().success().data(categoryService.findCategorys(category));
    }

    @GetMapping("category/list")
    @ResponseBody
    @RequiresPermissions("category:list")
    public FebsResponse categoryList(QueryRequest request, Category category) {
        Map<String, Object> dataTable = getDataTable(this.categoryService.findCategorys(request, category));
        return new FebsResponse().success().data(dataTable);
    }

    @ControllerEndpoint(operation = "新增Category", exceptionMessage = "新增Category失败")
    @PostMapping("category")
    @ResponseBody
    @RequiresPermissions("category:add")
    public FebsResponse addCategory(@Valid Category category) {
        this.categoryService.createCategory(category);
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "删除Category", exceptionMessage = "删除Category失败")
    @GetMapping("category/delete")
    @ResponseBody
    @RequiresPermissions("category:delete")
    public FebsResponse deleteCategory(Category category) {
        this.categoryService.deleteCategory(category);
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "修改Category", exceptionMessage = "修改Category失败")
    @PostMapping("category/update")
    @ResponseBody
    @RequiresPermissions("category:update")
    public FebsResponse updateCategory(Category category) {
        this.categoryService.updateCategory(category);
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "修改Category", exceptionMessage = "导出Excel失败")
    @GetMapping("category/excel")
    @ResponseBody
    @RequiresPermissions("category:export")
    public void export(QueryRequest queryRequest, Category category, HttpServletResponse response) {
        List<Category> categorys = this.categoryService.findCategorys(queryRequest, category).getRecords();
        ExcelKit.$Export(Category.class, response).downXlsx(categorys, false);
    }
}
