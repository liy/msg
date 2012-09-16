$(function(){
	var editorFrame = document.getElementsByClassName("editor-frame")[0];
	var editorDoc = null;
    if(editorFrame != null){
    	editorDoc = editorFrame.contentDocument;
		editorDoc.body.setAttribute("id", "editor-body");
		editorDoc.body.setAttribute("ContentEditable", "true");
		editorDoc.body.setAttribute("style", 'font-family: "Helvetica Neue", Helvetica, Arial, sans-serif')
		// editorFrame.contentDocument.body.designMode = "On";
		editorDoc.designMode = "On";
		// editorFrame.height = "600px";
		// editorFrame.contentDocument.body.setAttribute("scrolling", "no");
		console.log();
		// document.getElementById("editor-frame").contentWindow.document.body.className = "editor-body";


		var ctrlDown = false;
		editorDoc.onkeydown = function(e){
			// ctrl key, apple key(apple key is browser dependent)
			// http://stackoverflow.com/questions/3902635/how-does-one-capture-a-macs-command-key-via-javascript
			if(e.keyCode == 17 || e.keyCode == 224 || e.keyCode == 91 || e.keyCode == 93)
				ctrlDown = true;
			
			// ctrl + enter or apple + enter submit the form
			if(e.keyCode == 13 && ctrlDown){
				// perform form submit
				$("#new_entry").submit();
			}

			if(e.keyCode == 73 && ctrlDown){
				console.log("draw image");
				// drawImage();
			}
		};

		editorDoc.onkeyup = function(e){
			if(e.keyCode == 17 || e.keyCode == 224 || e.keyCode == 91 || e.keyCode == 93)
				ctrlDown = false;
		};

		editorFrame.contentDocument.body.focus();
    }

	


	// populate the text into the hidden textarea
	$("#new_entry").submit(function(){
		var text = editorFrame.contentDocument.body.innerHTML;
		text = text.replace(/&nbsp;/gi, " ");
		text = text.replace(/&gt;/gi, ">");
		text = text.replace(/&lt;/gi, "<");
		text = text.replace(/&amp;/gi, "&");
		text = text.replace(/<div>/, "\n");
		text = text.replace(/<\/div>/gi, "\n");
		text = text.replace(/<br>/gi, "\n");
		// Now we can clean the HTML
		text = text.replace(/<(?:.|\n)*?>/gm, '');
		text = $.trim(text);

		console.log(text);
		$("#entry_content").val(text);
	});
});