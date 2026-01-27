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
echo "    Cursor        ~/Library/Application Support/Cursor/User/"
echo "    Shortcuts     ~/.local/bin/keys"
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
