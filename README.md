# dotfiles

@takumifujiwaradairy の開発環境設定を管理するリポジトリです。
後輩・チームメンバーへの共有も兼ねているので、ツールの説明や使い方も載せています。

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/takumifujiwaradairy/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles

# 設定ファイルをセットアップ（シンボリックリンク作成 + Brewfileインストール）
./install.sh
```

## 管理ツール

### シンボリックリンクで管理（設定ファイルあり）

| ツール | 設定ファイル | ドキュメント |
|--------|-------------|-------------|
| **Ghostty** - 高速ターミナルエミュレータ | `ghostty/config` | [docs/ghostty.md](docs/ghostty.md) |
| **Starship** - カスタマイズ可能なプロンプト | `starship/starship.toml` | [docs/starship.md](docs/starship.md) |
| **Tmux** - 端末マルチプレクサー | `tmux/tmux.conf` | [docs/tmux.md](docs/tmux.md) |
| **fzf** - ファジーファインダー | `fzf/fzfrc` | [docs/fzf.md](docs/fzf.md) |
| **Claude Code** - AI開発支援CLI | `claude/clauderc` | [docs/claude.md](docs/claude.md) |
| **Git** - バージョン管理 | `git/.gitconfig` | - |
| **Zsh** - シェル設定 | `zsh/.zshrc`, `zsh/.zprofile` | - |
| **Karabiner-Elements** - キーボードカスタマイズ | `karabiner/karabiner.json` | - |
| **Cursor** - AIエディタ (Vim設定) | `cursor/settings.json`, `cursor/keybindings.json` | - |

### カタログ管理（リンク不要・目次として管理）

| ファイル | 内容 |
|----------|------|
| **[Brewfile](Brewfile)** | Homebrew全パッケージ一覧。`brew bundle` で一括インストール |
| **[ツールカタログ](docs/tools.md)** | 使用ツール全体の説明付き一覧（JetBrains IDE含む） |

## ファイル構成

```
dotfiles/
├── ghostty/
│   └── config              # Ghostty設定
├── starship/
│   └── starship.toml       # Starship設定
├── tmux/
│   └── tmux.conf           # Tmux設定
├── fzf/
│   └── fzfrc               # fzf設定
├── claude/
│   └── clauderc            # Claude Code設定
├── git/
│   └── .gitconfig          # Git設定・エイリアス
├── zsh/
│   ├── .zshrc              # Zshメイン設定
│   └── .zprofile           # Zshログイン設定
├── karabiner/
│   └── karabiner.json      # キーボードリマッピング
├── cursor/
│   ├── settings.json       # Cursor エディタ設定
│   └── keybindings.json    # Cursor キーバインド
├── shortcuts/
│   └── keys.sh             # ショートカット表示ツール
├── docs/                   # ドキュメント
│   ├── ghostty.md
│   ├── starship.md
│   ├── tmux.md
│   ├── fzf.md
│   ├── claude.md
│   └── tools.md            # ツールカタログ
├── Brewfile                # Homebrewパッケージ一覧
├── install.sh              # セットアップスクリプト
└── README.md
```

## ショートカット一覧表示

```bash
keys                    # 全てのショートカット一覧
keys tmux               # Tmuxのショートカットのみ
keys fzf                # fzfのショートカットのみ
keys claude             # Claude Codeのショートカットのみ
keys search git         # 'git'を含むショートカットを検索
```

## Gitエイリアス

```bash
git ss          # status
git co / cob    # checkout / checkout -b
git br / brm    # branch / branch -m
git adu / adup  # add -u / add -u -p
git com         # commit
git mg / mgff   # merge --no-ff / merge --ff
git cp          # cherry-pick
git logo        # log --oneline
git logn        # log --name-status --oneline
```

## Karabiner設定

- **CapsLock → Left Control** : Ctrlキーをホームポジションから
- **Left Ctrl + h/j/k/l → 矢印キー** : Vimライクなカーソル移動（システム全体）

## Brewfileの更新

自分の環境のパッケージをBrewfileに反映するには:

```bash
brew bundle dump --file=Brewfile --force
```
