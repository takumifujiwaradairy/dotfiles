#!/bin/bash
# ------------------------------------------------------------------
# Claude Code screenshot path auto-copier
# ------------------------------------------------------------------
# macOS のスクリーンショット (Cmd+Shift+3 / 4 / 5) を監視し、
# 新しい PNG が Desktop に作成されたら、その**絶対パス**を
# クリップボードにコピーする。
#
# 使い方:
#   1. このスクリプトを launchd で常駐させる
#   2. Cmd+Shift+4 でスクショ (Desktop に保存)
#   3. Claude Code プロンプトで Cmd+V → ファイルパスが貼られる
#   4. Enter → Claude が画像として読む
#
# 参考: https://hboon.com/automatically-copy-macos-screenshot-path-for-claude-code/
# ------------------------------------------------------------------

# Desktopパス (macOS日本語環境でも ~/Desktop は変わらない)
WATCH_DIR="$HOME/Desktop"

# fswatch が PATH に無い場合のフォールバック (Homebrew Apple Silicon)
FSWATCH="$(command -v fswatch || echo /opt/homebrew/bin/fswatch)"

# fswatchは全イベントを受ける(macOSスクショはCreatedを飛ばすことがあるため)。
# 同じパスを短時間に複数回コピーしないように直前のパス+時刻を記憶してデバウンス。
LAST_PATH=""
LAST_TIME=0
"$FSWATCH" -0 "$WATCH_DIR" | while IFS= read -r -d '' file; do
  case "$file" in
    *.png|*.PNG)
      base="$(basename "$file")"
      # スクショ命名パターンに限定 (Screenshot... / スクリーンショット... の両方)
      if [[ "$base" == Screenshot* || "$base" == スクリーンショット* ]]; then
        # ファイルが実在することを確認
        if [[ -f "$file" ]]; then
          now=$(date +%s)
          # 直前と同じパスで3秒以内なら無視 (重複イベント対策)
          if [[ "$file" != "$LAST_PATH" || $((now - LAST_TIME)) -gt 3 ]]; then
            printf '%s' "$file" | pbcopy
            LAST_PATH="$file"
            LAST_TIME=$now
          fi
        fi
      fi
      ;;
  esac
done
