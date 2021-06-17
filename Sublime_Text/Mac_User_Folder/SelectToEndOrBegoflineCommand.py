import sublime, sublime_plugin

class SelectToEndoflineCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        caretPos = self.view.sel()[0].begin()
        self.view.sel().add(sublime.Region(caretPos, self.view.line(caretPos).end()))

class SelectToBegoflineCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        caretPos = self.view.sel()[0].begin()
        self.view.sel().add(sublime.Region(caretPos, self.view.line(caretPos).begin()))