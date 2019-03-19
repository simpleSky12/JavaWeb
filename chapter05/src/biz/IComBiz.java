package biz;

import entity.Com;

import java.util.List;

public interface IComBiz {
    List<Com> getComments();
    public boolean addCom(Com com);
}
