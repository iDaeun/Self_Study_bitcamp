package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
	
	public MemberEntity findByIdx(Long idx);
	public List<MemberEntity> findByUnameLike(String name);
	public List<MemberEntity> findByIdxBetween(Long arg1, Long arg2);
	
	// @query사용
	@Query("select d from MemberEntity d order by d.idx desc") // d라는 별칭 사용
	public List<MemberEntity> findall();
}
