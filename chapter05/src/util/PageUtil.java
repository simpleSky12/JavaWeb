package util;

import java.util.List;

public class PageUtil<T> {
    private List<T> pageData;// 保存分页数据
    private int pageNum; // 当前页码
    private int pageSize = 5; // 每页显示的记录数，默认5
    private long totalCount; // 总记录数
    private int totalPage;// 总页数

    private PageUtil(){}

    public PageUtil(int pageSize){
        this.pageSize = pageSize;
    }

    public PageUtil(int pageSize,long totalCount){
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        // 计算总页数
        this.totalPage = (int) ((totalCount + pageSize-1)/pageSize);
    }

    public PageUtil(List<T> pageData,int pageNum,int pageSize,long totalCount){
        this(pageSize,totalCount);
        this.pageData = pageData;
        this.pageNum = pageNum;
    }

    public List<T> getPageData(){
        return pageData;
    }

    public void setPageData(List<T> pageData){
        this.pageData = pageData;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
        // 计算总页数
        this.totalPage = (int)((totalCount + pageSize-1)/pageSize);
    }

    public int getTotalPage() {
        return totalPage;
    }
}
