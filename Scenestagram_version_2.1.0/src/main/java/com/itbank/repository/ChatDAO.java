package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.ChatMessageDTO;

@Repository
public interface ChatDAO {

	List<HashMap<String, Object>> selectChatRoomList(int idx);

	List<HashMap<String, Object>> selectChatMessageList(int room_idx);

	int insertMessage(ChatMessageDTO dto);

}
