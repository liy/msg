// setup shortcuts
CodeMirror.keyMap.msg = {
	"Ctrl-Enter": function(cm) {
		$("#new_entry").submit();
	},
	"Cmd-Enter": function(cm) {
		$("#new_entry").submit();
	},
	fallthrough: ["default"] // defer keyMaps to default
};