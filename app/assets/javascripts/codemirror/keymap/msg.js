// setup shortcuts
CodeMirror.keyMap.msg = {
	"Ctrl-Enter": function(cm) {
		$("#codemirror").submit();
	},
	"Cmd-Enter": function(cm) {
		$("#codemirror").submit();
	},
	fallthrough: ["default"] // defer keyMaps to default
};