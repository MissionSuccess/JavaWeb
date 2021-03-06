package com.Nine.Sky_lnn.common;

public class Pager {
	/**页码*/
	private int pageNo = 1;
	/**页容量*/
	private int pageSize = 5;
	/**起始行号*/
	private int startRowNum;
	/**末行号*/
	private int endRowNum;
	/**总行数*/
	private int totalRows;
	/**总页数*/
	private int totalPages;
	
	private static final String DB_ORACLE = "oracle";
	private static final String DB_MYSQL = "mysql";
	private static final String DB = JdbcProperties.getDb();
	
	public Pager() { }
	
	public Pager(int pageNo) { 
		this.pageNo = pageNo;
	}

	public Pager(int pageNo, int pageSize, int totalPages, int startRowNum,
			int endRowNum, int totalRows) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalPages = totalPages;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.totalRows = totalRows;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPages() {
		if(this.totalRows % this.pageSize == 0){
			this.totalPages = this.totalRows / this.pageSize;
		}else{
			this.totalPages = this.totalRows / this.pageSize + 1; 
		}
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartRowNum() {
		if(DB.equals(DB_ORACLE)){
			this.startRowNum = pageSize* (pageNo -1) + 1 ;	//oracle 起始行号是1
		}else if(DB.equals(DB_MYSQL)){
			this.startRowNum = pageSize* (pageNo -1);		//mysql 起始行号是0
		}
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		this.endRowNum = pageNo * pageSize;
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	@Override
	public String toString() {
		return "Pager [pageNo=" + pageNo + ", pageSize=" + pageSize
				+ ", totalPages=" + totalPages + ", startRowNum=" + startRowNum
				+ ", endRowNum=" + endRowNum + ", totalRows=" + totalRows + "]";
	}

}
