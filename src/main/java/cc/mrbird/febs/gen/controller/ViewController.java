package cc.mrbird.febs.gen.controller;

import cc.mrbird.febs.common.entity.FebsConstant;
import cc.mrbird.febs.common.utils.DateUtil;
import cc.mrbird.febs.common.utils.FebsUtil;
import cc.mrbird.febs.gen.entity.Category;
import cc.mrbird.febs.gen.entity.SaleRecord;
import cc.mrbird.febs.gen.service.ICategoryService;
import cc.mrbird.febs.gen.service.ISaleRecordService;
import cc.mrbird.febs.system.entity.User;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author MrBird
 */
@Controller("saleRecordView")
@RequestMapping(FebsConstant.VIEW_PREFIX)
public class ViewController {
    @Autowired
    ICategoryService categoryService;
    @Autowired
    ISaleRecordService saleRecordService;

    @GetMapping("saleRecord/saleRecord")
    @RequiresPermissions("saleRecord:view")
    public String febsForm() {
        return FebsUtil.view("saleRecord/saleRecord");
    }

    @GetMapping("saleRecord/saleRecordTotal")
    @RequiresPermissions("saleRecordTotal:view")
    public String febsSaleRecordTotal() {
        return FebsUtil.view("saleRecord/saleRecordTotal");
    }

    @GetMapping("category/category")
    @RequiresPermissions("category:view")
    public String febsCategory() {
        return FebsUtil.view("category/category");
    }

    @GetMapping("saleRecord/add")
    @RequiresPermissions("saleRecord:add")
    public String systemUserAdd() {
        return FebsUtil.view("saleRecord/saleRecordAdd");
    }

    @GetMapping("category/add")
    @RequiresPermissions("category:add")
    public String categoryAdd() {
        return FebsUtil.view("category/categoryAdd");
    }

    @GetMapping("category/update/{categoryId}")
    @RequiresPermissions("category:update")
    public String systemUserUpdate(@PathVariable Long categoryId, Model model) {
        Category category = categoryService.getById(categoryId);
        model.addAttribute("category", category);
        User user = FebsUtil.getCurrentUser();
        if (user.getLastLoginTime() != null) {
            model.addAttribute("lastLoginTime", DateUtil.getDateFormat(user.getLastLoginTime(), DateUtil.FULL_TIME_SPLIT_PATTERN));
        }
        return FebsUtil.view("category/categoryUpdate");
    }

    @GetMapping("saleRecord/update/{saleRecordId}")
    @RequiresPermissions("category:update")
    public String saleRecordUpdate(@PathVariable Long saleRecordId, Model model) {
        SaleRecord saleRecord = saleRecordService.getById(saleRecordId);
        model.addAttribute("saleRecord", saleRecord);
        User user = FebsUtil.getCurrentUser();
        if (user.getLastLoginTime() != null) {
            model.addAttribute("lastLoginTime", DateUtil.getDateFormat(user.getLastLoginTime(), DateUtil.FULL_TIME_SPLIT_PATTERN));
        }
        return FebsUtil.view("saleRecord/saleRecordUpdate");
    }

}
