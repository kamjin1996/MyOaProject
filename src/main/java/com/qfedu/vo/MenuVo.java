package com.qfedu.vo;

import com.qfedu.pojo.Resource;

import java.util.ArrayList;
import java.util.List;

/**
 * 准备左侧菜单资源，MenuVo类表示一级菜单和多个子菜单
 *
 */
public class MenuVo {
    private Resource parent;
    private List<Resource> childrens;

    public Resource getParent() {
        return parent;
    }

    public void setParent(Resource parent) {
        this.parent = parent;
    }

    public List<Resource> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<Resource> childrens) {
        this.childrens = childrens;
    }

    /**
     *
     * @param resources 父级与子级菜单集合
     * @return 返回list泛型Menuvo
     *
     * 遍历resources，当parentid是-1，将此resouce赋值给parent，
     * 并记录当前resouc的id，并拿这个id和后边的resocu的parentid比较，
     * 如果符合则说明是此菜单的二级菜单，将此菜单添加到childs中
     * 组装了一个menuvo对象完成，在将此对象添加到提前准备好的menuvo类型的list中。
     */
    public static List<MenuVo> createMenuList(List<Resource> resources) {
        //准备一个list集合，保存menuvo
        List<MenuVo> menuVos = new ArrayList<>();
        //添加所有parentid是-1的到menuvo集合中，同时添加parentid等于当前resouc的id的对象到child中
        for(int i = 0;i<resources.size();i++){
            if(resources.get(i).getParentid()==-1&&resources.get(i).getType()!=2){
                int parentid = resources.get(i).getId();
                MenuVo menuVo = new MenuVo();
                menuVo.setParent(resources.get(i));
                List<Resource> rechild = new ArrayList<>();
                for(int j = 0;j<resources.size();j++){
                    if(parentid==resources.get(j).getParentid()){
                        rechild.add(resources.get(j));
                    }
                    menuVo.setChildrens(rechild);
                }
                menuVos.add(menuVo);
            }

        }
        return menuVos;
    }

}
