$(function(){
	var editorFrame = document.getElementById("editor-frame");
	// var codemirror = CodeMirror(editorFrame, {
	// 	mode: "markdown",
	// 	theme: "default",
	// 	lineWrapping: true
	// });

	// create codemirror editor
	var codemirror = CodeMirror.fromTextArea(document.getElementById("entry_content"), {
		// mode: "markdown",
		theme: "default",
		lineWrapping: true,
		autofocus: true,
		// shortcut keys for msg app
		keyMap: "msg"
	});
});