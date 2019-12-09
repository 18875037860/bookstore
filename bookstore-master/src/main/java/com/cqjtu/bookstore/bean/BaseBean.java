package com.cqjtu.bookstore.bean;

public class BaseBean {

	protected Object order;
	protected int currentPage = 1;

	public Object getOrder() {
		return order;
	}

	public void setOrder(Object order) {
		this.order = order;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
