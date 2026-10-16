#!/usr/bin/env bash
# Smoke test against the installed zellij: bash tests/check.sh
set -euo pipefail
cd "$(dirname "$0")/.."

fail() { echo "FAIL: $*" >&2; exit 1; }

# zj-cmd: action list comes from the installed zellij
list=$(bin/zj-cmd --list)
grep -q $'^new-pane\t' <<< "$list" || fail "zj-cmd --list lacks new-pane"
grep -q $'^close-pane\tClose the focused pane' <<< "$list" || fail "zj-cmd --list lacks close-pane description"

# zj-keybinds: fixture config, plus defaults for the tab mode
out=$(ZJ_KEYBINDS_CONFIG=tests/fixture.kdl ZJ_KEYBINDS_DEFAULT_MODES=tab bin/zj-keybinds)
for want in \
    '[tmux clear-defaults=true]' \
    '  "                      NewPane Down' \
    '  Up | k                 MoveFocus Up' \
    '  Esc                    back to Normal' \
    '  ?                      Run zj-keybinds (floating)' \
    '  Ctrl g | Ctrl t        (unbound)' \
    '[tab]  (zellij defaults)'; do
    grep -qxF -- "$want" <<< "$out" || fail "zj-keybinds missing line: $want"
done

echo "ok"
