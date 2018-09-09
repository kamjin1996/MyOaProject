package com.qfedu.service;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;


public interface ExcelService {
    //对userlist进行poi
    //导入excel
    int inExcel(CommonsMultipartFile file) throws IOException;

    //导出excel
    File outExcel() throws Exception;
}
