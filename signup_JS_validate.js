function validate(callingField, errorP) {
	var form = document.forms[0];
	var ele = form.elements[callingField];
	var errP = document.getElementById(errorP);
	var bttn = form.signup;
	ele.value = ele.value.trim();
	if (ele.value == "") {
		errP.innerHTML = "This is a mandatory field!";
		ele.style.border = "1px solid red";
		bttn.disabled = true;
		return;
	}
	if (callingField == "name") {
		var patt = /^[a-zA-Z ]*$/;
		if (!patt.test(ele.value)) {
			errP.innerHTML = "Name must only contain a-z and A-Z characters.";
			ele.style.border = "1px solid red";
			ele.value = "";
			bttn.disabled = true;
		}
	}
	else if (callingField == "age") {
		if (ele.value < 1 || ele.value > 120) {
			errP.innerHTML = "Invalid age!";
			ele.style.border = "1px solid red";
			ele.value = "";
			bttn.disabled = true;
		}
	}
	else if (callingField == "email") {
		var patt = /^([\w]+[.-])*[\w]+@+[\w-]+\.[a-zA-Z]{2,5}(\.[a-zA-Z]{2,5})?$/;
		if (!patt.test(ele.value)) {
			errP.innerHTML = "Invalid email address!";
			ele.style.border = "1px solid red";
			ele.value = "";
			bttn.disabled = true;
		}
	}
	else if (callingField == "contact") {
		var patt = /^[7-9]{1}[0-9]{6,10}$/;
		if (!patt.test(ele.value)) {
			errP.innerHTML = "Invalid contact number!";
			ele.style.border = "1px solid red";
			ele.value = "";
			bttn.disabled = true;
		}
	}
	else if (callingField == "username") {
		var patt = /^[a-zA-Z]([a-zA-Z0-9])*$/;
		if (!patt.test(ele.value)) {
			errP.innerHTML = "Username can only contain a-z and 0-9 characters and must start with an alphabet.";
			ele.style.border = "1px solid red";
			ele.value = "";
			bttn.disabled = true;
		}
	}
	else if (callingField == "password") {
		var patt = /^([\w@*#]{8,15})$/;
		if (!patt.test(ele.value)) {
			errP.innerHTML = "Password must be 8-15 characters long and must only contain a-z, A-Z, 0-9, @, *, #, _ characters.";
			ele.style.border = "1px solid red";
			ele.value = "";
			bttn.disabled = true;
		}
	}

}

function haveFocus(callingField, errorP) {
	var form = document.forms[0];
	var ele = form.elements[callingField];
	var errP = document.getElementById(errorP);
	errP.innerHTML = "";
	ele.style.border = "none";
	var bttn = form.signup;
	bttn.disabled = false;
}