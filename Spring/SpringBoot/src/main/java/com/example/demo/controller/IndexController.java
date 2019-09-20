package com.example.demo.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MemberDaoImpl;
import com.example.demo.domain.MemberInfo;
import com.example.demo.entity.MemberEntity;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.repository.MemberRepository;

@Controller
public class IndexController {

	@Autowired
	private MemberRepository repository;

	@Autowired
	private SqlSessionTemplate template;
	@Autowired
	private MemberMapper mapper;

	@RequestMapping("/")
	@ResponseBody
//	public String index() {
//		return "Spring Boot Start";
//	}
	public List<MemberEntity> index() {
		
		// @query 어노테이션 활용
		List<MemberEntity> list = repository.findall();
		
		return list;
	}

	@RequestMapping("/hello")
	public void hello1() {

	}

	@RequestMapping("/memberInfo")
	public void selectById() {

		mapper = template.getMapper(MemberMapper.class);

		MemberInfo info = mapper.selectMemberById("test");

		System.out.println(info);
	}

	@RequestMapping("/members")
	@ResponseBody
	public List<MemberInfo> selectAll() {

		mapper = template.getMapper(MemberMapper.class);

		List<MemberInfo> info = mapper.selectAll();

		for (MemberInfo memberInfo : info) {
			System.out.println(memberInfo);
		}

		return info;
	}

	@RequestMapping("/member/list")
	@ResponseBody
	public List<MemberEntity> getMemberList() {

		List<MemberEntity> list = null;
		list = repository.findAll();

		for (MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		return list;
	}

	// 추가
	@RequestMapping("/member/insert")
	@ResponseBody
	public String insertMember() {

		MemberEntity entity = new MemberEntity();
		entity.setUid("newnew");
		entity.setUname("newnew");
		entity.setUpw("12345");

		return repository.saveAndFlush(entity).toString();
	}

	// 수정
	@RequestMapping("/member/edit/{idx}")
	@ResponseBody
	public String editMember(@PathVariable("idx") int idx) {

		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		entity.setUid("oldold");
		entity.setUname("hihibye");
		entity.setUpw("1234567");

		return repository.saveAndFlush(entity).toString();
	}

	// 삭제
	@RequestMapping("/member/delete/{idx}")
	@ResponseBody
	public String deleteMember(@PathVariable("idx") int idx) {

		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);

		repository.delete(entity);

		return "delete";
	}
	
	// idx로 검색
	@RequestMapping("/member/member/{idx}")
	@ResponseBody
	public MemberEntity getMemberInfo(@PathVariable("idx") long idx) {
		
		MemberEntity entity = null;
		
		entity = repository.findByIdx(idx);
		System.out.println(entity);
		
		return entity;
	}
	
	// 이름으로 검색
	@RequestMapping("/member/memberbyname/{name}")
	@ResponseBody
	public List<MemberEntity> getMemberInfo(@PathVariable("name") String name) {
		
		List<MemberEntity> entitys = null;
		
		entitys = repository.findByUnameLike("%"+name+"%");
		System.out.println(entitys);
		
		return entitys;
	}
	
	// 2개의 idx 사이 범위의 리스트 검색
	@RequestMapping("/member/memberbetween")
	@ResponseBody
	public List<MemberEntity> getMemberInfo() {
		
		List<MemberEntity> entitys = null;
		
		entitys = repository.findByIdxBetween(8L, 11L);
		
		for (MemberEntity memberEntity : entitys) {
			System.out.println(entitys);
		}
		
		System.out.println(entitys.isEmpty());
		
		return entitys;
	}
	
	// EntityManager활용하여 기본적인 데이터베이스 처리 (별도의 코드작성없이 구현)
	@PersistenceContext
	EntityManager entityManager;
	
	private MemberDaoImpl dao; // 생성자 주입형식이라서 autowired(자동주입)이 아님, 유지보수면에서 더 좋은 방법
	
	@RequestMapping("/listall")
	@ResponseBody
	public List<MemberEntity> memberListAll() {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> list = dao.getAll();
		
		for (MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;		
	}
	
	@RequestMapping("/listbyidx/{idx}")
	@ResponseBody
	public MemberEntity memberByIdx(@PathVariable("idx") long idx) {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		MemberEntity entity = dao.findByIdx(idx);
		System.out.println(entity);
		
		return entity;		
	}
	
	@RequestMapping("/listbyname/{name}")
	@ResponseBody
	public List<MemberEntity> memberByIdx(@PathVariable("name") String name) {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> list = dao.findByUname(name);
		
		for (MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;		
	}
	
	// JPQL 활용
	@RequestMapping("/listfind/{str}")
	@ResponseBody
	public List<MemberEntity> listFind(@PathVariable("str") String str) {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> list = dao.find(str);
		
		for (MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;		
	}
	
	
}
