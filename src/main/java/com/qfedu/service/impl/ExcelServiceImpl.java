package com.qfedu.service.impl;

import com.qfedu.mapper.DepartmentMapper;
import com.qfedu.mapper.ExcelMapper;
import com.qfedu.pojo.Department;
import com.qfedu.pojo.User;
import com.qfedu.pojo.UserDepartment;
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
import java.util.Objects;

@Service
public class ExcelServiceImpl implements ExcelService {
    @Autowired
    private ExcelMapper excelMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

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
        List<ExcelVo> list = (List<ExcelVo>) ImportExcel.importExcel(path, 0, 0, ExcelVo.class);

        //开始持久化
        //插入用户
        List<User> users = new ArrayList<>();
        List<Department> departments = new ArrayList<>();
        List<UserDepartment> uds = new ArrayList<>();
        //第一个vo为列名
        for (int i = 0;i < list.size();i++){
            ExcelVo excelVo = list.get(i);
            if(Objects.equals("用户名",excelVo.getUsername())){
                continue;
            }
            User user = new User();
            Department department = new Department();
            if(excelVo.getId()==null){
                user.setId(null);
            } else {
                user.setId(excelVo.getId());
            }
            user.setUsername(excelVo.getUsername());
            user.setPassword(excelVo.getPassword());
            user.setFlag(excelVo.getFlag());
            users.add(user);
            //部门
            if(excelVo.getDepartmentName()!=null){
                //查询部门如果存在，则返回id并设置给当前部门，不存在则创建
                Department de =  excelMapper.selectByDepartName(excelVo.getDepartmentName());
                if(de == null){
                    department.setName(excelVo.getDepartmentName());
                } else {

                    department.setId(de.getId());
                }
            } else {
                departments.add(department);
            }
            departments.add(department);
            //用户部门
        }
        excelMapper.insertUsers(users);
        excelMapper.insertDeps(departments);
        //设置uds
        for(int j = 0;j < users.size();j++){
            UserDepartment ud = new UserDepartment();
            ud.setDid(departments.get(j).getId());
            ud.setUid(users.get(j).getId());
            uds.add(ud);
        }
        excelMapper.insertUserDeps(uds);
        //插入对应部门
        //如果部门不存在则创建
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
