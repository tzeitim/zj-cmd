# Demo GIF for the README. Run from the repo root:  vhs demo/demo.tape
# Needs vhs, zellij, fzf. Records a throwaway zellij session named "zj-demo".

Output demo/demo.gif

Require zellij
Require fzf

Set Shell "bash"
Set FontSize 16
Set Width 1200
Set Height 700
Set Padding 10
Set TypingSpeed 75ms
Set Theme "Catppuccin Mocha"

# Off camera: put the scripts on PATH and start a clean session.
Hide
Type "export PATH=$PWD/bin:$PATH ZELLIJ_CONFIG_DIR=$PWD/demo PS1='$ '" Enter
Type "zellij delete-session --force zj-demo 2>/dev/null; clear" Enter
Type "zellij attach --create zj-demo" Enter
Sleep 3s
Show

Sleep 1s

# 1. Alt x: fuzzy-find an action, read its help, run it.
Alt+x
Sleep 1.5s
Type "rename-tab"
Sleep 2.5s
Enter
Sleep 800ms
Type "demo"
Sleep 800ms
Enter
Sleep 2s

# 2. Actions take their options; this one splits the pane you came from.
Alt+x
Sleep 1s
Type "new-pane"
Sleep 1.5s
Enter
Sleep 500ms
Type "--direction right"
Sleep 800ms
Enter
Sleep 2s

# 3. Actions that print something show their output in a floating pane.
Alt+x
Sleep 1s
Type "query-tab-names"
Sleep 1.2s
Enter
Sleep 500ms
Enter
Sleep 3s
Type "q"
Sleep 1s

# 4. Alt /: cheat sheet of your keybinds plus zellij's defaults.
# VHS cannot send Alt+/ (the GIF shows no keys anyway), so open what Alt+/ opens off camera.
Hide
Type "zellij run --floating --close-on-exit --name keybinds -- zj-keybinds; clear" Enter
Sleep 1s
Show
Sleep 3s
Type "/Alt"
Enter
Sleep 2.5s
Type "q"
Sleep 1.5s

# Off camera: remove the demo session.
Hide
Ctrl+q
Sleep 1s
Type "zellij delete-session --force zj-demo 2>/dev/null" Enter
