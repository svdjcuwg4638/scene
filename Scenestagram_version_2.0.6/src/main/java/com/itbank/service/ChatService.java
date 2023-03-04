package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ChatMessageDTO;
import com.itbank.repository.ChatDAO;

@Service
public class ChatService {

	@Autowired private ChatDAO chatDAO;
	
	public List<HashMap<String, Object>> getChatRoomList(int idx) {
		return chatDAO.selectChatRoomList(idx);
	}

	public List<HashMap<String, Object>> getChatMessageList(int room_idx) {
		return chatDAO.selectChatMessageList(room_idx);
	}

	public int addMessage(ChatMessageDTO dto) {		
		return chatDAO.insertMessage(dto);
	}

}
