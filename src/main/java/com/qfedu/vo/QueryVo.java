package com.qfedu.vo;

import com.qfedu.pojo.User;

import java.util.List;

/**
 * 为LayUI的页面展示(list)准备的分页查询vo
 * @param <T> 子菜单下list的泛型 如resource user role等
 */
public class QueryVo <T> {
    private int code;
    private int count;
    private String msg;
    private List<T> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    /**
     * 组成一个页面
     * @param count 页面中所有的条目数
     * @param data 具体页面list数据
     * @param <T> list数据类型
     * @return 此page对象将在controller作为json格式返回 对应着LayUI展示list类型页面的数据接口
     */
    public static <T> QueryVo<T> createPage(int count, List<T> data){
        QueryVo<T> page = new QueryVo<T>();
        page.setCode(0);
        page.setCount(count);
        page.setMsg("ok");
        page.setData(data);
        return page;
    }
}


