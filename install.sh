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

echo "🎉 dotfilesのセットアップが完了しました！"
echo ""
echo "📋 セットアップされた設定:"
echo "   • Ghostty: ~/.config/ghostty/config"
echo ""
echo "💡 Ghosttyを再起動して設定を反映してください。"
