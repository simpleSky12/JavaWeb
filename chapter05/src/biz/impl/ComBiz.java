package biz.impl;

import biz.IComBiz;
import dao.IComDao;
import dao.impl.ComDao;
import entity.Com;

import java.util.List;

public class ComBiz implements IComBiz {
    private IComDao comDao = new ComDao();
    public List<Com> getComments(){
        return comDao.getComments();
    }
    public boolean addCom(Com com){
        return comDao.addCom(com)>0;
    }
}
