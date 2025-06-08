#!/bin/bash

# dotfiles install script
# Usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 dotfiles セットアップを開始します..."

# Ghostty設定のセットアップ
echo "📱 Ghostty設定をセットアップしています..."

# ~/.config ディレクトリが存在しない場合は作成
mkdir -p ~/.config/ghostty

# 既存の設定ファイルがある場合はバックアップ
if [ -f ~/.config/ghostty/config ]; then
    echo "⚠️  既存のGhostty設定をバックアップします..."
    mv ~/.config/ghostty/config ~/.config/ghostty/config.backup.$(date +%Y%m%d_%H%M%S)
fi

# シンボリックリンクを作成
ln -sf "${DOTFILES_DIR}/ghostty/config" ~/.config/ghostty/config
echo "✅ Ghostty設定ファイルをリンクしました: ~/.config/ghostty/config"

# Starship設定のセットアップ
echo "🚀 Starship設定をセットアップしています..."

# 既存の設定ファイルがある場合はバックアップ
if [ -f ~/.config/starship.toml ]; then
    echo "⚠️  既存のStarship設定をバックアップします..."
    mv ~/.config/starship.toml ~/.config/starship.toml.backup.$(date +%Y%m%d_%H%M%S)
fi

# シンボリックリンクを作成
ln -sf "${DOTFILES_DIR}/starship/starship.toml" ~/.config/starship.toml
echo "✅ Starship設定ファイルをリンクしました: ~/.config/starship.toml"

# Tmux設定のセットアップ
echo "🖥️  Tmux設定をセットアップしています..."

# 既存の設定ファイルがある場合はバックアップ
if [ -f ~/.tmux.conf ]; then
    echo "⚠️  既存のTmux設定をバックアップします..."
    mv ~/.tmux.conf ~/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)
fi

# シンボリックリンクを作成
ln -sf "${DOTFILES_DIR}/tmux/tmux.conf" ~/.tmux.conf
echo "✅ Tmux設定ファイルをリンクしました: ~/.tmux.conf"

echo "🎉 dotfilesのセットアップが完了しました！"
echo ""
echo "📋 セットアップされた設定:"
echo "   • Ghostty: ~/.config/ghostty/config"
echo "   • Starship: ~/.config/starship.toml" 
echo "   • Tmux: ~/.tmux.conf"
echo ""
echo "💡 次の手順を実行してください:"
echo "   1. 必要なツールをインストール:"
echo "      brew install tmux"
echo "   2. Ghosttyを再起動して設定を反映"
echo "   3. シェルプロファイル（~/.zshrc）にStarshipの初期化コードを追加:"
echo "      eval \"\$(starship init zsh)\""
echo "   4. Tmuxプラグインマネージャー（TPM）をインストール:"
echo "      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
echo "   5. 新しいターミナルセッションを開始"
echo "   6. Tmuxを起動してプラグインをインストール（Ctrl+a + I）"
