#!/bin/bash

# ショートカットキー一覧表示ツール

show_help() {
    echo "使用方法: shortcuts [オプション]"
    echo ""
    echo "オプション:"
    echo "  all, -a     全てのショートカットを表示"
    echo "  tmux, -t    Tmuxのショートカットのみ"
    echo "  fzf, -f     fzfのショートカットのみ"
    echo "  claude, -c  Claude Codeのショートカットのみ"
    echo "  system, -s  システム全般のショートカット"
    echo "  search, -S  ショートカットを検索"
    echo "  help, -h    このヘルプを表示"
}

show_tmux_shortcuts() {
    echo "🖥️  TMUX ショートカット"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📋 基本操作"
    echo "  Ctrl+a d           セッションをデタッチ"
    echo "  Ctrl+a c           新しいウィンドウを作成"
    echo "  Ctrl+a r           設定ファイルを再読み込み"
    echo "  Ctrl+a ?           キーバインド一覧を表示"
    echo ""
    echo "🔲 ペイン操作"
    echo "  Ctrl+a %           垂直分割（左右に分割）"
    echo "  Ctrl+a \"           水平分割（上下に分割）"
    echo "  Alt+←→↑↓          ペイン間を移動"
    echo "  Ctrl+a f           ペインを最大化/最小化"
    echo "  Ctrl+a x           ペインを閉じる"
    echo "  Ctrl+a S           ペインの同期オン/オフ"
    echo ""
    echo "🪟 ウィンドウ操作"
    echo "  Ctrl+a n           次のウィンドウ"
    echo "  Ctrl+a p           前のウィンドウ"
    echo "  Ctrl+a 0-9         指定番号のウィンドウに移動"
    echo "  Ctrl+a ,           ウィンドウ名を変更"
    echo "  Ctrl+a &           ウィンドウを閉じる"
    echo "  Ctrl+Alt+←→       ウィンドウ切り替え"
    echo ""
    echo "📦 セッション操作"
    echo "  Ctrl+a s           セッション一覧を表示"
    echo "  Ctrl+a $           セッション名を変更"
    echo "  Ctrl+Alt+↑↓       セッション切り替え"
    echo ""
}

show_fzf_shortcuts() {
    echo "🔍 FZF ショートカット"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📋 基本操作"
    echo "  Ctrl+T             ファイル検索・挿入"
    echo "  Ctrl+R             コマンド履歴検索"
    echo "  Alt+C              ディレクトリ移動"
    echo ""
    echo "🎛️  fzf内での操作"
    echo "  Enter              選択して確定"
    echo "  Esc                キャンセル"
    echo "  Tab                複数選択"
    echo "  Shift+Tab          選択解除"
    echo "  Ctrl+A             全て選択"
    echo "  Ctrl+D             全て選択解除"
    echo "  Ctrl+/             プレビュー表示切り替え"
    echo ""
    echo "🔧 便利なコマンド"
    echo "  fe / ff            ファイル検索＆エディタで開く"
    echo "  fcd                ディレクトリ検索＆移動"
    echo "  fco                Gitブランチ選択＆チェックアウト"
    echo "  flog               Gitログをインタラクティブに表示"
    echo "  fkill              プロセス検索＆終了"
    echo "  fssh               SSH接続先を選択"
    echo ""
}

show_claude_shortcuts() {
    echo "🤖 CLAUDE CODE ショートカット"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📋 基本コマンド"
    echo "  c / claude         Claude Codeを起動"
    echo "  cask               質問する"
    echo "  cedit              ファイルを編集"
    echo "  cchat              チャットモード"
    echo ""
    echo "📁 ファイル操作"
    echo "  cfile <file>       ファイルを分析"
    echo "  cfiles <files>     複数ファイルを分析"
    echo "  cproject           プロジェクト全体を分析"
    echo "  cdir               ディレクトリ構造を分析"
    echo ""
    echo "🔄 Git統合"
    echo "  ccommit            コミットメッセージを生成"
    echo "  creview            コミットをレビュー"
    echo "  cdiff [type]       差分をレビュー"
    echo "  cgit               Git状態を説明"
    echo ""
    echo "🛠️  開発支援"
    echo "  cdebug             デバッグ支援"
    echo "  crefactor          リファクタリング支援"
    echo "  cerror <error>     エラー解決支援"
    echo "  csecurity          セキュリティチェック"
    echo "  cperformance       パフォーマンス改善"
    echo ""
    echo "❓ ヘルプ"
    echo "  chelp              ヘルプを表示"
    echo "  cstatus            ステータス確認"
    echo ""
}

show_system_shortcuts() {
    echo "⚙️  システム全般 ショートカット"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📋 ターミナル基本"
    echo "  Cmd+T              新しいタブ"
    echo "  Cmd+W              タブを閉じる"
    echo "  Cmd+Shift+]        次のタブ"
    echo "  Cmd+Shift+[        前のタブ"
    echo "  Cmd+D              垂直分割（Ghostty）"
    echo "  Cmd+Shift+D        水平分割（Ghostty）"
    echo ""
    echo "🎨 Starshipプロンプト情報"
    echo "  🌱                 Gitブランチ"
    echo "  🌝 🌛 🌘           ファイル状態（同期済み/変更/未追跡）"
    echo "  👾                 変更されたファイル"
    echo "  🛸                 追跡されていないファイル"
    echo "  🌞                 スタッシュ"
    echo "  🕙                 現在時刻"
    echo ""
    echo "📂 一般的なコマンド"
    echo "  ls / exa           ディレクトリ一覧"
    echo "  cat / bat          ファイル内容表示"
    echo "  grep / rg          テキスト検索"
    echo "  find / fd          ファイル検索"
    echo ""
}

search_shortcuts() {
    local query="$1"
    if [ -z "$query" ]; then
        read -p "検索キーワードを入力してください: " query
    fi
    
    echo "🔍 '$query' の検索結果"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # 全ショートカットを一時ファイルに出力してgrepで検索
    {
        show_tmux_shortcuts
        echo ""
        show_fzf_shortcuts
        echo ""
        show_claude_shortcuts
        echo ""
        show_system_shortcuts
    } | grep -i "$query" --color=always
}

show_all_shortcuts() {
    echo "🎯 全ショートカット一覧"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    show_tmux_shortcuts
    echo ""
    show_fzf_shortcuts
    echo ""
    show_claude_shortcuts
    echo ""
    show_system_shortcuts
    
    echo ""
    echo "💡 Tip: 'shortcuts search <キーワード>' で検索できます"
    echo "例: shortcuts search git"
}

# 引数に応じて処理を分岐
case "${1:-all}" in
    "all"|"-a"|"")
        show_all_shortcuts
        ;;
    "tmux"|"-t")
        show_tmux_shortcuts
        ;;
    "fzf"|"-f")
        show_fzf_shortcuts
        ;;
    "claude"|"-c")
        show_claude_shortcuts
        ;;
    "system"|"-s")
        show_system_shortcuts
        ;;
    "search"|"-S")
        search_shortcuts "$2"
        ;;
    "help"|"-h")
        show_help
        ;;
    *)
        echo "❌ 不明なオプション: $1"
        echo ""
        show_help
        exit 1
        ;;
esac 