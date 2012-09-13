$(function(){
	$("#content").autoResize().focus();

	$.fn.getPreText = function () {
	var ce = $("<pre />").html(this.html());
	if ($.browser.webkit)
	ce.find("div").replaceWith(function() { return "\n" + this.innerHTML; });
	if ($.browser.msie)
	ce.find("p").replaceWith(function() { return this.innerHTML + "<br>"; });
	if ($.browser.mozilla || $.browser.opera || $.browser.msie)
	ce.find("br").replaceWith("\n");

	return ce.text();
	};


	function submit(){
		var formData = new FormData();
		formData.append("entry[content]", $("#editable-content").getPreText());

		var xhr = new XMLHttpRequest();
		xhr.open('post', '/entries', true);
		xhr.send(formData);
	}

	var ctrlDown = false;
	document.onkeydown = function(e){
		// ctrl key, apple key(apple key is browser dependent)
		// http://stackoverflow.com/questions/3902635/how-does-one-capture-a-macs-command-key-via-javascript
		if(e.keyCode == 17 || e.keyCode == 224 || e.keyCode == 91 || e.keyCode == 93)
			ctrlDown = true;
		
		// ctrl + enter or apple + enter submit the form
		if(e.keyCode == 13 && ctrlDown){
			// perform form submit
			// $("#new_entry").submit();
			submit();
		}
	};

	document.onkeyup = function(e){
		if(e.keyCode == 17 || e.keyCode == 224 || e.keyCode == 91 || e.keyCode == 93)
			ctrlDown = false;
	};


});