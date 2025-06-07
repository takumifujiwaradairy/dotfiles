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

## ファイル構成

```
dotfiles/
├── ghostty/
│   └── config          # Ghostty設定ファイル
├── starship/
│   └── starship.toml   # Starship設定ファイル
├── docs/               # ドキュメント
├── install.sh          # セットアップスクリプト
└── README.md
```

## ツール詳細

各ツールの詳細な設定や使用方法については、`docs/`フォルダ内の各ドキュメントを参照してください。
