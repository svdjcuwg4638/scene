package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.UsersDTO;

@Repository
public interface UsersDAO {

	int insert(UsersDTO dto);	// 회원가입

	UsersDTO login(UsersDTO dto);	// 로그인 체크
	
	int updateUserStatus(int idx);

	int infoUpdate(UsersDTO dto);

	UsersDTO selectOne(int idx);

	int idCheck(String id);

	List<UsersDTO> getList();

	String findId(UsersDTO dto);

	int updatePw(UsersDTO dto);

	int countUserNickName(String nickName);

	int countUserPhoneNumber(String phoneNumber);

	List<UsersDTO> usersSearch(String search);

	List<HashMap<String, Object>> hashSearch(String searchValue);

	int countUserEmailPhoneNumber(HashMap<String, Object> param);

	UsersDTO selectOneNickName(String nick_name);

	int selectUserIDXByNickName(String nick_name);
	
	List<UsersDTO> recommend(int idx);

   	List<UsersDTO> recommendFamous(int idx);

	int updateuser_img(HashMap<String, Object> map);

}
