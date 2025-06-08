# dotfiles

このリポジトリは、@takumifujiwaradairyが個人利用する為のdotfilesです。
様々なツールや設定情報を管理しています。

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 設定ファイルをセットアップ
./install.sh
```

## 管理ツール
- **ターミナル**: [Ghostty](docs/ghostty.md) - 高速で現代的なターミナルエミュレータ
- **プロンプト**: [Starship](docs/starship.md) - 高速でカスタマイズ可能なプロンプト
- **マルチプレクサー**: [Tmux](docs/tmux.md) - 端末マルチプレクサー
- **ファジーファインダー**: [fzf](docs/fzf.md) - 高速ファイル・履歴検索
- **AI開発支援**: [Claude Code](docs/claude.md) - AI駆動のコード生成・分析

## ファイル構成

```
dotfiles/
├── ghostty/
│   └── config          # Ghostty設定ファイル
├── starship/
│   └── starship.toml   # Starship設定ファイル
├── tmux/
│   └── tmux.conf       # Tmux設定ファイル
├── fzf/
│   └── fzfrc           # fzf設定ファイル
├── claude/
│   └── clauderc        # Claude Code設定ファイル
├── docs/               # ドキュメント
├── install.sh          # セットアップスクリプト
└── README.md
```

## ツール詳細

各ツールの詳細な設定や使用方法については、`docs/`フォルダ内の各ドキュメントを参照してください。
