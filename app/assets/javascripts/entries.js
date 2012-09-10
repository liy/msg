$(function(){
	$("#content").autoResize().focus();

	var ctrlDown = false;
	document.onkeydown = function(e){
		// ctrl key, apple key(apple key is browser dependent)
		// http://stackoverflow.com/questions/3902635/how-does-one-capture-a-macs-command-key-via-javascript
		if(e.keyCode == 17 || e.keyCode == 224 || e.keyCode == 91 || e.keyCode == 93)
			ctrlDown = true;
		
		// ctrl + enter or apple + enter submit the form
		if(e.keyCode == 13 && ctrlDown){
			// perform form submit
			$("#new_entry").submit();
		}
	};

	document.onkeyup = function(e){
		if(e.keyCode == 17 || e.keyCode == 224 || e.keyCode == 91 || e.keyCode == 93)
			ctrlDown = false;
	};
});