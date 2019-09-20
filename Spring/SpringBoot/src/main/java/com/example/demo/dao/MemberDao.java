package com.example.demo.dao;

import java.io.Serializable;
import java.util.List;

public interface MemberDao<T> extends Serializable {
	
	// T로 정의되어있는 인터페이스를 사용
	public List<T> getAll();
	public T findByIdx(long idx);
	public List<T> findByUname(String name);
	
	// JPQL
	public List<T> find(String fstr);
	
}
