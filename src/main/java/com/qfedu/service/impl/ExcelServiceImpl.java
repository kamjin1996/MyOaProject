package com.qfedu.service.impl;

import com.qfedu.mapper.ExcelMapper;
import com.qfedu.service.ExcelService;
import com.qfedu.utils.poi.ExportExcel;
import com.qfedu.utils.poi.ImportExcel;
import com.qfedu.utils.poi2.WriteExcel;
import com.qfedu.vo.ExcelVo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {
    @Autowired
    private ExcelMapper excelMapper;

    private static final String IN_TARGET = "D:/userdeps.xls";

    private static final String OUT_TARGET = "D:/用户部门信息表.xls";

    //定义列名
    private static final String[] ROWNAMES = {"用户ID", "用户名", "密码", "标识", "部门"};

    //定义sheetname
    private static final String SHEETNAME = "员工部门信息";


    @Override
    public int inExcel(CommonsMultipartFile file) throws IOException {
        file.transferTo(new File(IN_TARGET));
        File targ = new File(IN_TARGET);
        String path = targ.getAbsolutePath();
        List<?> list = ImportExcel.importExcel(path, 0, 0, ExcelVo.class);
        System.out.println(list);
        return 0;
    }

    @Override
    public File outExcel() throws Exception {
        //数据集合
        List<Object[]> dataList = new ArrayList<>();
        //被转换的数据库数据
        List<ExcelVo> excelVos = excelMapper.selectExcel();
        for (ExcelVo excelVo : excelVos) {
            Object[] o = {excelVo.getId(), excelVo.getUsername(), excelVo.getPassword(), excelVo.getFlag(), excelVo.getDepartmentName()};
            dataList.add(o);
        }
        WriteExcel writeExcel = new WriteExcel(ROWNAMES, dataList, SHEETNAME);
        writeExcel.saveToFile(OUT_TARGET);
        File outexcel = new File(OUT_TARGET);
        return outexcel;
    }
}
