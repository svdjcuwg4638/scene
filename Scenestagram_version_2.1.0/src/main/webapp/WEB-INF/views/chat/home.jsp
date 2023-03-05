<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/chat.css">
<link rel="stylesheet" href="${cpath }/resources/css/chat_home.css">
<script>
	const username = '${login.nick_name}'	
	const loginIdx = '${login.idx}'	
	const serverName = '${pageContext.request.serverName}'
</script>

<div class="main_wrap">
	<div id="dm">	
	    <div class="dm-box">
	        <div class="dm-box-left">
	            <div style="text-align: center; margin: 0; overflow: hidden; width: 100%;">
                    <div class="dm-left-top">
                        <div class="login_nick">${login.nick_name }</div>
                    </div>
	                
                    <div class="dm-content">
                        <!-- dm 아이템 loop -->
                        <div id="room">
						<c:forEach var="room" items="${list }">							
                        	<div class="item flex" room="${room.IDX }" user="${room.USERS_IDX }">	                        	                       	
	                            <div class="user_img" img="${room.USER_IMG }">		                           
	                                <img src="${cpath }/resources/img/${room.USER_IMG }" alt="">		                            
	                            </div>		                            
	                            <div class="user_nick">${room.NICK_NAME }</div>		                            	        
	                        </div>                        	
                        </c:forEach>
						</div>	                        
                        <!-- dm 아이템 loop end -->
                    </div>
                </div>	        
            </div>
	        <div class="dm-box-right">
	        	<div class="dm-right-top">
                    <div class="user_info"></div>
                </div>
	        	<div class="message_box">  	
		            <div style="text-align: center; margin: 50% 0;">
		                <svg aria-label="Direct" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="96" role="img" viewBox="0 0 96 96" width="96"><circle cx="48" cy="48" fill="none" r="47" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle><line fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2" x1="69.286" x2="41.447" y1="33.21" y2="48.804"></line><polygon fill="none" points="47.254 73.123 71.376 31.998 24.546 32.002 41.448 48.805 47.254 73.123" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon></svg>
		                <div style="font-size: 20px; margin: 5px;">내 메세지</div>
		                <div style="color: #A8A8A8; margin-bottom: 10px; font-size: 14px;">친구에게 사진과 메시지를 보내보세요</div>
	            	</div>		            	            
	        	</div>
	        	<div class="bottom_box">
	        		<div class="bottom">
	        			<div class="bottom_menu">
							<input id="send" class="send" name="send" autofocus>
							<input id="btn" class="btn" type="button" value="보내기">					
						</div>
					</div>
	        	</div>		        
	    	</div>
	    </div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/chat_home.js"></script>

</body>
</html>