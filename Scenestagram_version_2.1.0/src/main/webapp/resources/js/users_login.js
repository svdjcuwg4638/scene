const inputPhoneNumber = document.querySelector("#id");
const inputPassword = document.querySelector("#pw");
const button = document.querySelector(".btn");

function loginBtn() {
	let idValue = inputPhoneNumber.value;
	let passwordValue = inputPassword.value;

	if (idValue.length > 0 && passwordValue.length > 0) {
		button.disabled = false;
		button.style.cursor = "pointer";
		button.style.backgroundColor = "#1c7ed6";
	} else {
		button.disabled = true;
		button.style.cursor = "default";
		button.style.backgroundColor = "#bfdffd";
	}
};

inputPhoneNumber.addEventListener('keyup', loginBtn);
inputPassword.addEventListener('keyup', loginBtn);