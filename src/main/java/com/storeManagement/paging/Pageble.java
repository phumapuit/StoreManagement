package com.storeManagement.paging;


import com.storeManagement.sort.Sorter;

public interface Pageble {
	Integer getPage();
	Integer getOffset();
	Integer getLimit();
	Sorter getSorter();
}
