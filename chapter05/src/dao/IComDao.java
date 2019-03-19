package dao;

import entity.Com;

import java.util.List;

public interface IComDao {
    List<Com> getComments();
    public int addCom(Com com);
}
