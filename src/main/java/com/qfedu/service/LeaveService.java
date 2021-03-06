package com.qfedu.service;

import com.qfedu.pojo.Leave;
import com.qfedu.pojo.LeaveLog;
import com.qfedu.vo.QueryVo;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.task.Task;

public interface LeaveService {
    //流程列表
    QueryVo<Leave> allTask();
    void initPro();
    //发起申请
    void createPro(Leave leave, String uname, String rname);
    //我的待办事项
    QueryVo<Leave> doingTask(int uid);
    //确认申请
    void comTask(String tid,int lid,int flag,int uid);
    //查看流历史
    QueryVo<HistoricTaskInstance> queryHistory(String uname, int page, int count);
    //查看日志
    QueryVo<LeaveLog> queryLog(int page, int count);
}
