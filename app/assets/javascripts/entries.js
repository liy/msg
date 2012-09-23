$(function(){
	var editorFrame = document.getElementById("editor-frame");
	// var codemirror = CodeMirror(editorFrame, {
	// 	mode: "markdown",
	// 	theme: "default",
	// 	lineWrapping: true
	// });

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
	}
});