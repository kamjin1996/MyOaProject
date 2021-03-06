package com.qfedu.web.controller;

import com.qfedu.mapper.ExcelMapper;
import com.qfedu.pojo.Department;
import com.qfedu.pojo.User;
import com.qfedu.service.ExcelService;
import com.qfedu.utils.poi2.WriteExcel;
import com.qfedu.vo.ExcelVo;
import com.qfedu.vo.QueryVo;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 专门对excel进行poi操作的控制器
 */

@Controller
public class ExcelController {
    @Autowired
    private ExcelService excelServie;

    //导入Excel
    @RequestMapping("/inexcel.do")
    public @ResponseBody
    QueryVo uploadExcel(@RequestParam("file") CommonsMultipartFile file) throws IOException {
        QueryVo queryVo = new QueryVo();
        int i = excelServie.inExcel(file);
        if(i>0){
            queryVo.setCode(0);
        } else {
            queryVo.setCode(1);
        }
        return queryVo;
    }

    //导出excel
    @RequestMapping("/outexcel.do")
    public void outExcel(HttpServletResponse response) throws Exception {
        //得到excel的file对象
        File file = excelServie.outExcel();
        byte[] bytes = FileUtils.readFileToByteArray(file);
        String filename="userdep.xls";
        filename= URLEncoder.encode(filename,"utf-8");
        //将文件返回到页面下载
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename="+filename);
        response.getOutputStream().write(bytes);

    }
}