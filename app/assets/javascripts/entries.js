$(function(){
	var editorFrame = document.getElementById("editor-frame");
	// var codemirror = CodeMirror(editorFrame, {
	// 	mode: "markdown",
	// 	theme: "default",
	// 	lineWrapping: true
	// });

	// setup shortcuts
	// CodeMirror.keyMap.msg = {
	// 	"Ctrl-Enter": function(cm) {
	// 		$("#new_entry").submit();
	// 	},
	// 	"Cmd-Enter": function(cm) {
	// 		$("#new_entry").submit();
	// 	},
	// 	fallthrough: ["basic"]
	// };

	// create codemirror editor
	var codemirror = CodeMirror.fromTextArea(document.getElementById("entry_content"), {
		mode: "markdown",
		theme: "default",
		lineWrapping: true
		// keyMap: "msg"
	});


});