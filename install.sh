#!/bin/bash

# dotfiles install script
# Usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "dotfiles セットアップを開始します..."

# =============================================================================
# ヘルパー関数
# =============================================================================

link_file() {
    local src="$1"
    local dest="$2"
    local name="$3"

    # 親ディレクトリが存在しない場合は作成
    mkdir -p "$(dirname "$dest")"

    # 既存の設定ファイルがある場合はバックアップ
    if [ -f "$dest" ] && [ ! -L "$dest" ]; then
        echo "  既存の${name}設定をバックアップ: ${dest}.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$dest" "${dest}.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # シンボリックリンクを作成
    ln -sf "$src" "$dest"
    echo "  [OK] ${name}: ${dest}"
}

link_dir() {
    local src="$1"
    local dest="$2"
    local name="$3"

    # 親ディレクトリが存在しない場合は作成
    mkdir -p "$(dirname "$dest")"

    # 既存のディレクトリ(実体)があればバックアップ
    if [ -d "$dest" ] && [ ! -L "$dest" ]; then
        echo "  既存の${name}設定をバックアップ: ${dest}.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$dest" "${dest}.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # 既存のsymlinkは一旦削除(ln -sfnだとディレクトリsymlinkの更新が不安定なため)
    if [ -L "$dest" ]; then
        rm "$dest"
    fi

    # ディレクトリsymlinkを作成
    ln -s "$src" "$dest"
    echo "  [OK] ${name}: ${dest}"
}

# =============================================================================
# ターミナル・シェル
# =============================================================================

echo ""
echo "--- ターミナル・シェル ---"

link_file "${DOTFILES_DIR}/ghostty/config" \
    ~/.config/ghostty/config \
    "Ghostty"

link_file "${DOTFILES_DIR}/starship/starship.toml" \
    ~/.config/starship.toml \
    "Starship"

link_file "${DOTFILES_DIR}/tmux/tmux.conf" \
    ~/.tmux.conf \
    "Tmux"

link_file "${DOTFILES_DIR}/zsh/.zshrc" \
    ~/.zshrc \
    "Zsh (.zshrc)"

link_file "${DOTFILES_DIR}/zsh/.zprofile" \
    ~/.zprofile \
    "Zsh (.zprofile)"

# =============================================================================
# ツール設定
# =============================================================================

echo ""
echo "--- ツール設定 ---"

link_file "${DOTFILES_DIR}/fzf/fzfrc" \
    ~/.config/fzfrc \
    "fzf"

link_file "${DOTFILES_DIR}/claude/clauderc" \
    ~/.config/clauderc \
    "Claude Code"

link_file "${DOTFILES_DIR}/git/.gitconfig" \
    ~/.gitconfig \
    "Git"

link_file "${DOTFILES_DIR}/karabiner/karabiner.json" \
    ~/.config/karabiner/karabiner.json \
    "Karabiner-Elements"

link_file "${DOTFILES_DIR}/lazygit/config.yml" \
    ~/.config/lazygit/config.yml \
    "lazygit"

# =============================================================================
# エディタ (NeoVim / LazyVim)
# =============================================================================

echo ""
echo "--- エディタ (NeoVim / LazyVim) ---"

link_dir "${DOTFILES_DIR}/nvim" \
    ~/.config/nvim \
    "NeoVim (LazyVim)"

# =============================================================================
# エディタ (Cursor)
# =============================================================================

echo ""
echo "--- エディタ (Cursor) ---"

CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"

link_file "${DOTFILES_DIR}/cursor/settings.json" \
    "${CURSOR_USER_DIR}/settings.json" \
    "Cursor (settings)"

link_file "${DOTFILES_DIR}/cursor/keybindings.json" \
    "${CURSOR_USER_DIR}/keybindings.json" \
    "Cursor (keybindings)"

# =============================================================================
# ショートカットツール
# =============================================================================

echo ""
echo "--- ユーティリティ ---"

mkdir -p ~/.local/bin
link_file "${DOTFILES_DIR}/shortcuts/keys.sh" \
    ~/.local/bin/keys \
    "Shortcuts (keys)"

# =============================================================================
# Claude Code スクリーンショット自動パスコピー watcher
# =============================================================================
# macOSスクショ(Cmd+Shift+4)がDesktopに保存されたら、そのパスを自動で
# クリップボードへコピーする launchd agent。
# Claude Code では Cmd+V でパスを貼付 → Claude が画像として読む。

echo ""
echo "--- Claude Code スクリーンショット watcher ---"

# TCC (macOS権限) 制約で、launchd は ~/Documents/ 配下のスクリプトを実行できない。
# そのため symlink ではなく **copy** で ~/.local/bin/ に配置する。
WATCHER_SRC="${DOTFILES_DIR}/scripts/claude-screenshot-watcher.sh"
WATCHER_DEST="$HOME/.local/bin/claude-screenshot-watcher.sh"
if [ -f "$WATCHER_SRC" ]; then
    cp "$WATCHER_SRC" "$WATCHER_DEST"
    chmod +x "$WATCHER_DEST"
    echo "  [OK] Watcher script: ${WATCHER_DEST}"
fi

# launchd plist を ~/Library/LaunchAgents/ にコピー → agent をロード
PLIST_SRC="${DOTFILES_DIR}/launchd/com.fujiwaratakumi.claude-screenshot-watcher.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/com.fujiwaratakumi.claude-screenshot-watcher.plist"
if [ -f "$PLIST_SRC" ]; then
    mkdir -p "$HOME/Library/LaunchAgents"
    cp "$PLIST_SRC" "$PLIST_DEST"
    launchctl unload "$PLIST_DEST" 2>/dev/null || true
    launchctl load "$PLIST_DEST"
    echo "  [OK] launchd agent: ${PLIST_DEST}"
fi

# スクショのフローティングサムネイルを無効化
# (表示中は画像がclipboardに残り、watcherのパスコピーが上書きされる副作用回避)
defaults write com.apple.screencapture show-thumbnail -bool false
killall SystemUIServer 2>/dev/null || true
echo "  [OK] スクショのフローティングサムネイルを無効化 (show-thumbnail=false)"

# =============================================================================
# Homebrew パッケージ（オプション）
# =============================================================================

echo ""
echo "--- Homebrew パッケージ ---"

if command -v brew &>/dev/null; then
    read -p "Brewfileからパッケージをインストールしますか？ [y/N] " answer
    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        echo "  Brewfileからインストール中..."
        brew bundle --file="${DOTFILES_DIR}/Brewfile"
        echo "  [OK] Brewfileのインストール完了"
    else
        echo "  スキップしました"
    fi
else
    echo "  Homebrewが見つかりません。先にインストールしてください:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
fi

# =============================================================================
# 完了
# =============================================================================

echo ""
echo "========================================="
echo " セットアップ完了"
echo "========================================="
echo ""
echo "セットアップされた設定:"
echo "  [シンボリックリンク]"
echo "    Ghostty      ~/.config/ghostty/config"
echo "    Starship      ~/.config/starship.toml"
echo "    Tmux          ~/.tmux.conf"
echo "    Zsh           ~/.zshrc, ~/.zprofile"
echo "    fzf           ~/.config/fzfrc"
echo "    Claude Code   ~/.config/clauderc"
echo "    Git           ~/.gitconfig"
echo "    Karabiner     ~/.config/karabiner/karabiner.json"
echo "    lazygit       ~/.config/lazygit/config.yml"
echo "    NeoVim        ~/.config/nvim (LazyVim)"
echo "    Cursor        ~/Library/Application Support/Cursor/User/"
echo "    Shortcuts     ~/.local/bin/keys"
echo "    スクショwatcher  ~/.local/bin/claude-screenshot-watcher.sh"
echo "                     (launchd: ~/Library/LaunchAgents/...)"
echo ""
echo "  [カタログのみ（リンク不要）]"
echo "    Brewfile      brew bundle --file=Brewfile で一括インストール"
echo "    ツール一覧    docs/tools.md を参照"
echo ""
echo "次の手順:"
echo "  1. シェルを再起動: exec zsh"
echo "  2. Ghosttyを再起動して設定を反映"
echo "  3. Karabiner-Elementsを再起動"
echo "  4. ショートカット確認: keys"
echo ""
