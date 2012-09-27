$(function(){
	var entry_content = document.getElementById("entry_content");
	if(entry_content){
		// create codemirror editor
		var codemirror = CodeMirror.fromTextArea(entry_content, {
			mode: "markdown",
			theme: "default",
			lineWrapping: true,
			autofocus: true,
			// shortcut keys for msg app
			keyMap: "msg"
		});

		var currentLine = codemirror.setLineClass(0, "activeLine");
		codemirror.on("cursorActivity", function(){
			codemirror.setLineClass(currentLine, null, null);
			currentLine = codemirror.setLineClass(codemirror.getCursor().line, null, "activeLine");
		});
	}
	
	

});