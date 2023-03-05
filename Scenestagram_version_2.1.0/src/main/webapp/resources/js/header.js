// delete 모달 버튼 상호작용 스크립트
// 버튼
const post_add_moda_delete_btn = document.querySelector('.post_add_moda_delete_btn > div:nth-child(1)')
const post_add_moda_delete_back = document.querySelector('.post_add_moda_delete_btn > div:nth-child(2)')

// 뒷배경과 모달창
const post_add_modal_delete_modal = document.querySelector('.post_add_modal_delete_modal')

function post_add_moda_delete_btn_handler() {
	post_add_modal_delete_modal.classList.add('hidden')
	post_add_modal_delete.classList.add('hidden')
	post_upload_img.classList.remove('hidden')
	post_add_action.classList.add('hidden')
	post_add_modal_wrap.classList.add('hidden')
	post_add_modal_back.classList.add('hidden')
	post_add_modal_wrap.style.width = '50%'
	
	$('.sidebar_post_add_form')[0].reset();
}
post_add_moda_delete_btn.onclick = post_add_moda_delete_btn_handler

function post_add_moda_delete_back_handler() {
	post_add_modal_delete_modal.classList.add('hidden')
}
post_add_moda_delete_back.onclick = post_add_moda_delete_back_handler

// 포스트 모달 다음사진 이전사진 스크립트
const post_add_back_btn = document.querySelector('.post_add_back_btn')
const post_add_next_btn = document.querySelector('.post_add_next_btn')

// 이전 버튼 눌렀을때
function post_add_back_handler() {
	const img_list = post_add_preview.getAttribute('img_list')
	if(post_add_file.files && post_add_file.files[+img_list - 2]){
		const reader = new FileReader()
		reader.onload =function(e){
			post_add_preview.src =  e.target.result
		}
		reader.readAsDataURL(post_add_file.files[+img_list -2])
		post_add_preview.setAttribute('img_list',+img_list - 1)
		if(img_list == 2){
			post_add_back_btn.classList.add('hidden')
		}
		post_add_next_btn.classList.remove('hidden')
	}
	else{post_add_preview.src=''}
}

post_add_back_btn.onclick = post_add_back_handler

// 사이드바 포스트 추가 버튼 작동 스크립트
//공유하기 버튼
const post_add_action_btn = document.querySelector('.post_add_action_btn')
// form
const post_add_form = document.querySelector('.sidebar_post_add_form')
// 완료 문구
const post_add_finish_modal = document.querySelector('.post_add_finish_modal')
// 상단 타이틀
const post_add_modal_title_content = document.querySelector('.post_add_modal_title_content')

// 버튼 클릭시 추가하고 완료창 뛰워준다
function post_add_controllHandler(event) {
	event.preventDefault()
	post_add_modal_delete.classList.add('hidden')
	post_add_action.classList.add('hidden')
	let post_add_form_data = document.querySelector('.sidebar_post_add_form')
	let formData = new FormData(post_add_form_data)
	fetch('${cpath}/post/add',{
		method: "POST",
		body : formData
	}).then(resp => resp.text())
	.then(text =>{
		if(text == 1){
			post_add_form.classList.add('hidden')
			post_add_finish_modal.classList.remove('hidden')
			post_add_modal_title_content.innerText ='게시물이 공유되었습니다'
			post_add_modal_wrap.style.width = '50%'
			$('.sidebar_post_add_form')[0].reset();
		}
	})
}

post_add_action_btn.onclick = post_add_controllHandler

// 다음 버튼 눌렀을때
function post_add_next_handler() {
	const img_list = post_add_preview.getAttribute('img_list')
	post_add_back_btn.classList.remove('hidden')
	if(post_add_file.files && post_add_file.files[+img_list + 0]){
		const reader = new FileReader()
		reader.onload =function(e){
			post_add_preview.src =  e.target.result
		}
		reader.readAsDataURL(post_add_file.files[+img_list])
		post_add_preview.setAttribute('img_list',+img_list + 1)
		if(!post_add_file.files[+img_list + 1]){
			post_add_next_btn.classList.add('hidden')
		}
	}
	else{post_add_preview.src=''}
}

post_add_next_btn.onclick = post_add_next_handler

// 사이드바 포스트 추가 스크립트
const post_add_file = document.querySelector('input[name="image_file"]')
const post_add_preview = document.querySelector('.post_add_preview')
const post_add_action = document.querySelector('.post_add_action')
const post_add_modal_wrap = document.querySelector('.post_add_modal_wrap')
const post_upload_img = document.querySelector('.post_upload_img')

function handleDragOver(e) {
	e.preventDefault();
}

function handleDrop(e) {
	e.preventDefault();

	const files = e.dataTransfer.files;
	const input = document.getElementById('post_add_file');

	if (files.length > 0) {
		input.files = files;
		input.dispatchEvent(new Event('change'));
	}
}

const dropZone = document.querySelector('.post_upload_img');

dropZone.addEventListener('dragover', handleDragOver);
dropZone.addEventListener('drop', handleDrop);

function postAddFormHandler(event){
	post_upload_img.classList.add('hidden')
	post_add_action.classList.remove('hidden')
	post_add_modal_wrap.style.minWidth = '700px'
	post_add_modal_delete.classList.remove('hidden')
	if(event.target.files && event.target.files[0]){
		if(event.target.files[1]){
			post_add_preview.setAttribute('img_list',1)
			post_add_next_btn.classList.remove('hidden')
		}
		const reader = new FileReader()
		reader.onload =function(e){
			post_add_preview.src =  e.target.result
		}
		reader.readAsDataURL(event.target.files[0]) 
	}
	else{
		post_add_preview.src=''
	}
}
post_add_file.onchange = postAddFormHandler

// 사진이 입력되고 바같 누를시 모달창 뛰우기
const post_add_modal_delete = document.querySelector('.post_add_modal_delete')

function post_add_modal_delete_handler(){
	post_add_modal_delete_modal.classList.remove('hidden')
}

post_add_modal_delete.onclick = post_add_modal_delete_handler


// 사진 드래그 오버시 배경색 svg색 변경코드
const postAddModalWrap = document.querySelector('.post_add_modal_wrap');
const postAddImg = document.querySelector('.post_add_img > svg');
const postAddImgAll = document.querySelectorAll('.post_upload_img *:not(label)')

postAddModalWrap.addEventListener('dragover', function(e) {
  e.preventDefault();
  post_upload_img.style.backgroundColor = '#141414'
  postAddImgAll.forEach(e=>e.style.backgroundColor = '#141414')
});

postAddModalWrap.addEventListener('dragleave', function() {
	 post_upload_img.style.backgroundColor = '#222'
	 postAddImgAll.forEach(e=>e.style.backgroundColor = '#222')
});

postAddModalWrap.addEventListener('drop', function() {
	post_upload_img.style.backgroundColor = '#222'
	postAddImgAll.forEach(e=>e.style.backgroundColor = '#222')
});

// 사이드바 게시물 작성 버튼 스크립트
const post_add_start_btn =document.querySelector('.post_add_start_btn')
	
function post_add_start_btn_handler(){
	post_add_modal_back.classList.remove('hidden')
	post_add_modal_wrap.classList.remove('hidden')
}

post_add_start_btn.onclick = post_add_start_btn_handler

// 배경과 x눌렀을때 돌아가기 스크립트
const post_add_modal_back = document.querySelector('.post_add_modal_back')

function post_add_modal_back_handler(){
	post_add_modal_back.classList.add('hidden')
	post_add_modal_wrap.classList.add('hidden')
	post_add_finish_modal.classList.add('hidden')
	post_upload_img.classList.remove('hidden')
	post_add_modal_title_content.innerText ='새 게시물 만들기'
	post_add_form.classList.remove('hidden')
}

post_add_modal_back.onclick = post_add_modal_back_handler

// 사이드바 이동 스크립트
//프로필 누를시 viewdetail이동
const sidevar_go_profile  = document.querySelector('.sidevar_go_profile')
go_profile_url = cpath + '/users/viewDetail/' + users_idx 
function go_profile_handler() {location.href = go_profile_url}
sidevar_go_profile.onclick = go_profile_handler
	
// 홈 누를시 홈화면 이동
const sidevar_go_main  = document.querySelector('.sidevar_go_main')
go_home_url = cpath + '/users/main'
function go_home_handler() {location.href = go_home_url}
sidevar_go_main.onclick = go_home_handler
	
// 탐색 탭 누를시 탐색 탭 이동
const sidevar_go_explore  = document.querySelector('.sidevar_go_explore')
go_explore_url = cpath + '/post/explore'
function go_explore_handler() {location.href = go_explore_url}
sidevar_go_explore.onclick = go_explore_handler
	
// 메시지 누를시 메시지 탭 이동
const sidevar_go_chat  = document.querySelector('.sidevar_go_chat')
go_chat_url = cpath + '/chat/home'
function go_chat_handler() {location.href = go_chat_url}
sidevar_go_chat.onclick = go_chat_handler

// 사이드바 검색 표시 숨기기
const searchBtn = document.querySelector('.search-btn')
const searchBar = document.querySelector('.search-box')
const sideBar = document.querySelector('.sidebar')
  
let searchASC = 0
function searchHandler(){
   if(searchASC == 0) {
	   $('.logo-img').css('display','none')
	   $('div.main').css('margin-left','70px')
	   $('.logo-icon').css('display','block')
	   $('.sidebar').css('width','72px')
	   $('.sidebar button > span').css('width','50px')
	   $('.sidebar button > span > span').css('opacity','0')
	   $('.sidebar button > span > span').css('visibility','hidden')
       searchBar.style.left="72px"    		   

	   searchASC = 1
   }
   else if (searchASC == 1) {
      searchBar.style.left="-350px"
   	   $('.logo-img').css('display','block')
	   $('div.main').css('margin-left','0')
	   $('.logo-icon').css('display','none')
	   $('.sidebar').css('width','220px')
	   $('.sidebar button > span').css('width','125')
	   $('.sidebar button > span > span').css('opacity','1')
	   $('.sidebar button > span > span').css('visibility','visible')
    	searchASC = 0
   }
}
searchBtn.onclick = searchHandler

// 더보기 클릭시 요청 처리
//설정 누를시infoModify이동
const more_menu_option_btn  = document.querySelector('.more_menu_option_btn')
go_infoModify_url = cpath + '/users/infoModify'
function go_infoModify_handler() {location.href = go_infoModify_url}
more_menu_option_btn.onclick = go_infoModify_handler
	
// 로그아웃 누를시 로그아웃 요청
const more_menu_logout_btn  = document.querySelector('.more_menu_logout_btn')
go_logout_url = cpath + '/users/logout'
function go_logout_handler() {
	alert('로그아웃 되셨습니다.')  		
	location.replace(go_logout_url);
}
more_menu_logout_btn.onclick = go_logout_handler

// 더보기 표시 숨기기
const more_menu = document.querySelector('.more_menu')
const more_menu_btn = document.querySelector('.more_menu_btn')
let menuShowVal = 0
function moreMenuShowHandler(){
   if(menuShowVal == 0) {
	   more_menu.style.opacity = "1"
		   more_menu.style.zIndex="4"
		   menuShowVal = 1
   }
   else if (menuShowVal == 1) {
	   more_menu.style.opacity = "0"
		   more_menu.style.zIndex="-1"
		   menuShowVal = 0
   }
}
more_menu_btn.onclick = moreMenuShowHandler

// 사이드바 검색 효과
const root = document.getElementById('root')
const form = document.getElementById('form')

function searchOptionHandler(event) {  
  root.innerHTML = ''        // 다른 옵션 선택하면 기존에 보던 애들 날려주기
  
//   const option = document.querySelector('input[name="option"]:checked').value // 옵션 = 옵션(라디오)에 체크된.값
  const selectOption = document.getElementById('option')
  const option = selectOption.options[selectOption.selectedIndex].value
  console.log(option)
  const searchValue = document.querySelector('input[name="searchValue"]').value
  console.log(searchValue)
  
  if(option == 'usersOption') {
     fetch(cpath + '/usersSearch/' + searchValue)
     .then(resp => resp.json())
     .then(json => {
        console.log(json)   // 여기에 지금 유저리스트 담겨있스빈다
        root.innerHTML = ''
        json.forEach(dto => {
			let tag = ''      // 여기에 유저 프사 넣는 것도 해야됨
			tag += '<a href="' + cpath + '/users/viewDetail/'+ dto.idx + '">'
			tag += '		<div style="display: flex;">'
			tag += '			<img style="width: 44px; height:44px; border-radius: 30px;" src="' + cpath + '/resources/img/'+ dto.user_img + '">'
			tag += '         <div class="search_nick_name"> '
			tag += '				<div>' + dto.nick_name + '</div>'
			tag += '				<div>' + dto.name + '</div>'
			tag += '         </div>'
			tag += '		</div>'
			tag += '</a>'
           root.innerHTML += tag
        })
     })
  }
  else if (option == 'hashOption') {
	     fetch(cpath + '/hashSearch/' + searchValue)
	     .then(resp => resp.json())
	     .then(json => {
	    	 console.log(json)
	        root.innerHTML = ''
	        json.forEach(dto => {
	           let tag = ''
	           tag += '<a href="' + cpath + '/post/postList/'+ dto.HASHTAG.replace("#", "") + '/">'
	           tag += '		<div class="hashTagDiv">'
	           tag += '  		<div class="x6s0dn4 x1619dve x14yjl9h xudhj91 x18nykt9 xww2gxu x13fuv20 xu3j5b3 x1q0q8m5 x26u7qi x9f619 x3nfvp2 xl56j7k x1n2onr6 xtuw4uo xeud2gj x18oi6gw x13ehr01" style="width: 44px; height: 44px;"><svg aria-label="해시태그" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="16" role="img" viewBox="0 0 24 24" width="16"><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="4.728" x2="20.635" y1="7.915" y2="7.915"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="3.364" x2="19.272" y1="15.186" y2="15.186"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="17.009" x2="13.368" y1="2" y2="22"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="10.64" x2="7" y1="2" y2="22"></line></svg></div>'
	           tag += '  		<div>'
	           tag += '				<div class="name">' + dto.HASHTAG + '</div>'
	           tag += '      		<div>게시물'+ ' ' + dto.COUNT_HASHTAG + '</div>'
	           tag += '  		</div>'
	           tag += '		</div>'
	           tag += '</a>'
	           root.innerHTML += tag
	        })
	     })
	  }
}

searchBar.onkeyup = searchOptionHandler