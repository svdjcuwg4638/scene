package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.UsersDTO;
import com.itbank.repository.UsersDAO;

@Service
public class UsersService {	
	
	@Autowired private UsersDAO usersDAO;
	
	public int insert(UsersDTO dto) {
		return usersDAO.insert(dto);
	}

	public UsersDTO login(UsersDTO dto) {
		return usersDAO.login(dto);
	}
	
	public int withdrawal(int idx) {
		return usersDAO.updateUserStatus(idx);
	}

	public int infoModify(UsersDTO dto) {
		return usersDAO.infoUpdate(dto);
	}

	public UsersDTO getUser(int idx) {		
		return usersDAO.selectOne(idx);
	}

	public int idCheck(String id) {
		return usersDAO.idCheck(id);
	}

	public List<UsersDTO> getList() {
		return usersDAO.getList();
	}

	public String findId(UsersDTO dto) {
		return usersDAO.findId(dto);
	}

	public int replacePw(UsersDTO dto) {
		return usersDAO.updatePw(dto);
	}

	public int getUserNickName(String nickName) {
		return usersDAO.countUserNickName(nickName);
	}

	public int getUserPhoneNumber(String phoneNumber) {
		return usersDAO.countUserPhoneNumber(phoneNumber);
	}
	
	public List<UsersDTO> usersSearch(String search) {
		return usersDAO.usersSearch(search);
	}

	public List<HashMap<String, Object>> hashSearch(String searchValue) {
		return usersDAO.hashSearch(searchValue);
	}

	public int emailFindUsers(String email, String phone_number) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("email",email);
		param.put("phone_number",phone_number);
		
		return usersDAO.countUserEmailPhoneNumber(param);
	}

	public UsersDTO getNickNameUser(String nick_name) {
		return usersDAO.selectOneNickName(nick_name);
	}

	public int getUserIDXByNickName(String nick_name) {
		return usersDAO.selectUserIDXByNickName(nick_name);
	}

	public List<UsersDTO> recommend(int idx) {
	      return usersDAO.recommend(idx);
	}

 	public List<UsersDTO> recommendFamous(int idx) {
		return usersDAO.recommendFamous(idx);
   	}

	public int profileImgModify(String fileName, int idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userimg", fileName);
		map.put("idx", idx);
		return usersDAO.updateuser_img(map);
	}
}
