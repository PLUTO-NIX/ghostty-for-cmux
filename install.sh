#!/bin/bash
set -euo pipefail

echo "=== cmux + Ghostty config installer ==="

# Ghostty config
mkdir -p ~/.config/ghostty/themes
cp ghostty/config ~/.config/ghostty/config
cp ghostty/themes/cursor-dark ~/.config/ghostty/themes/cursor-dark
echo "[OK] Ghostty config -> ~/.config/ghostty/"

# cmux settings
mkdir -p ~/.config/cmux
if [ -f ~/.config/cmux/settings.json ]; then
  echo "[SKIP] ~/.config/cmux/settings.json already exists (backup: settings.json.bak)"
  cp ~/.config/cmux/settings.json ~/.config/cmux/settings.json.bak
fi
cp cmux/settings.json ~/.config/cmux/settings.json
echo "[OK] cmux settings -> ~/.config/cmux/"

# Reload if cmux is running
if command -v cmux &>/dev/null && cmux ping &>/dev/null; then
  cmux reload-config
  echo "[OK] cmux config reloaded"
else
  echo "[INFO] cmux not running. Restart cmux to apply."
fi

echo ""
echo "=== Done ==="
echo "Font changes may require opening a new tab/workspace."
echo ""
echo "Required fonts (install separately):"
echo "  - JetBrains Mono: https://www.jetbrains.com/lp/mono/"
echo "  - Pretendard Variable (Korean): https://github.com/orioncactus/pretendard"
