package com.house.kh.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

@Repository
public class SellerDao {
	
	public int insertMember(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.insert("sellerMapper.insertMember", s);
	}
	
	public Seller searchUser(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.selectOne("sellerMapper.searchUser", s);
	}
	
	public int searchIdVali(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("sellerMapper.searchIdVali", id);
	}
	
	
	public ArrayList<Seller> getAllSeller(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("sellerMapper.getAllSeller");
	}
	
	
	public int getSellerPoint(SqlSessionTemplate sqlSession, int selNo) {
		Seller getSeller = sqlSession.selectOne("sellerMapper.getSellerPoint", selNo);
		int sellerPoint = getSeller.getSelPoint();
		return sellerPoint;
	}
	
	public Seller getSellerInfo(SqlSessionTemplate sqlSession, int selNo) {
		return sqlSession.selectOne("sellerMapper.getSellerInfo", selNo);
	}
	
	public int doUpdate(SqlSessionTemplate sqlSession, Seller seller) {
		return sqlSession.update("sellerMapper.doUpdate", seller);
	}
	
	
}
