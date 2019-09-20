package com.example.demo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.example.demo.entity.MemberEntity;

public class MemberDaoImpl implements MemberDao<MemberEntity> {

	private EntityManager entityManager;

	/**
	 * @param entityManager
	 */
	public MemberDaoImpl(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}

	// 리스트 뽑기
	@Override
	public List<MemberEntity> getAll() {

		Query query = entityManager.createQuery("from MemberEntity"); // 테이블 이름 대신 entity객체 이름을 써야함
		List<MemberEntity> list = query.getResultList(); // 여러개의 값 받음
		entityManager.close();

		return list;
	}

	// idx로 검색
	@Override
	public MemberEntity findByIdx(long idx) {

		Query query = entityManager.createQuery("from MemberEntity where idx =" + idx);
		MemberEntity memberEntity = (MemberEntity) query.getSingleResult(); // 하나의 결과값 받음

		return memberEntity;
	}

	// 이름으로 검색
	@Override
	public List<MemberEntity> findByUname(String name) {

		Query query = entityManager.createQuery("from MemberEntity where uname ='" + name + "'");
		List<MemberEntity> list = query.getResultList();

		return list;
	}

	@Override
	public List<MemberEntity> find(String fstr) {

		List<MemberEntity> list = null;

		// :~~~ = '?'로 만드는 대신 JPQL에서 매개변수로 사용할 수 있도록
		String qSql = "from MemberEntity where idx = :fidx or uname like :fname or uid like :fid";
		Long fidx = 0L; // 만약 들어온 fstr이 숫자타입이 아니라면 '0', autoincrement는 1부터 시작이므로 해당사항 없음
		try {
			fidx = Long.parseLong(fstr); // string ---> long
		} catch (Exception e) {
			// TODO: handle exception
		}

		// chain형식으로 파라미터 세팅하여 변수 매핑해줌
		//Query query = entityManager.createQuery(qSql).setParameter("fidx", fidx).setParameter("fname", "%" + fstr + "%")
		//		.setParameter("fid", "%" + fstr + "%");
		
		// 쿼리 어노테이션 활용 (entity에서 쿼리문 지정)
		Query query = entityManager.createNamedQuery("findWithParam").setParameter("fidx", fidx).setParameter("fname", "%" + fstr + "%")
		.setParameter("fid", "%" + fstr + "%");
		
		list = query.getResultList();

		return list;
	}

}
