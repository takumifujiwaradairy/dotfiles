# ツールカタログ

開発環境で使用しているツール一覧。
設定ファイルがdotfilesで管理されているものには `[dotfiles管理]` マークを付けています。

---

## ターミナル・シェル

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Ghostty](https://ghostty.org/)** `[dotfiles管理]` | GPU加速の高速ターミナルエミュレータ。低レイテンシで描画がなめらか | `brew install --cask ghostty` |
| **[Starship](https://starship.rs/)** `[dotfiles管理]` | Rust製の高速シェルプロンプト。Git情報やバッテリー表示をカスタマイズ可能 | `brew install starship` |
| **[tmux](https://github.com/tmux/tmux)** `[dotfiles管理]` | ターミナルマルチプレクサー。画面分割・セッション管理に必須 | `brew install tmux` |
| **[Warp](https://www.warp.dev/)** | モダンなターミナル。AI補完やブロックベースの入力が特徴 | `brew install --cask warp` |
| **[Alacritty](https://alacritty.org/)** | GPU加速のターミナルエミュレータ。設定はYAMLベース | `brew install --cask alacritty` |
| **Zsh** `[dotfiles管理]` | macOSデフォルトのシェル。.zshrc/.zprofileで環境変数やPATHを管理 | macOS標準搭載 |

## エディタ・IDE

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Cursor](https://cursor.com/)** `[dotfiles管理]` | AI統合エディタ。VSCodeベースでVimキーバインド設定済み | `brew install --cask cursor` |
| **[VS Code](https://code.visualstudio.com/)** | 定番のコードエディタ。Salesforce開発で主に使用 | `brew install --cask visual-studio-code` |
| **[JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/)** | JetBrains IDEの管理ツール。以下のIDEをインストール・管理 | `brew install --cask jetbrains-toolbox` |

### JetBrains IDE（Toolbox経由で管理）

Toolbox Appからインストール。プロジェクトの言語に合わせて使い分ける。

| IDE | 用途 |
|-----|------|
| **IntelliJ IDEA** | Java/Kotlin/汎用 |
| **WebStorm** | JavaScript/TypeScript/フロントエンド |
| **RubyMine** | Ruby/Rails |
| **PyCharm** | Python |
| **GoLand** | Go |
| **PhpStorm** | PHP |
| **CLion** | C/C++ |
| **Rider** | .NET/C# |
| **Android Studio** | Android開発（Google製だがToolboxで管理可能） |

## ファイル検索・ナビゲーション

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[fzf](https://github.com/junegunn/fzf)** `[dotfiles管理]` | ファジーファインダー。ファイル検索・Git操作・プロセスkillなど多用途 | `brew install fzf` |
| **[ripgrep (rg)](https://github.com/BurntSushi/ripgrep)** | 超高速grep。.gitignoreを自動で尊重する | `brew install ripgrep` |
| **[fd](https://github.com/sharkdp/fd)** | findコマンドの高速版。直感的な構文 | `brew install fd` |
| **[bat](https://github.com/sharkdp/bat)** | catコマンドの強化版。シンタックスハイライト・行番号付き | `brew install bat` |
| **[tree](https://mama.indstate.edu/users/ice/tree/)** | ディレクトリ構造をツリー表示 | `brew install tree` |

## Git関連

| ツール | 説明 | インストール |
|--------|------|-------------|
| **Git** `[dotfiles管理]` | バージョン管理。豊富なエイリアスを設定済み（ss, co, cob, logo等） | macOS標準 / `brew install git` |
| **[Git LFS](https://git-lfs.com/)** | 大容量ファイルのGit管理 | `brew install git-lfs` |
| **[gh](https://cli.github.com/)** | GitHub公式CLI。PR作成・Issue管理をターミナルから | `brew install gh` |
| **[tig](https://jonas.github.io/tig/)** | テキストベースのGit UI。ログ閲覧やdiffが見やすい | `brew install tig` |
| **[GitHub Desktop](https://desktop.github.com/)** | Git GUIクライアント。視覚的な差分確認に便利 | `brew install --cask github` |

## AI開発支援

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Claude Code](https://docs.anthropic.com/en/docs/claude-code)** `[dotfiles管理]` | Anthropic製のAI CLIツール。コード生成・分析・リファクタリング | `npm install -g @anthropic-ai/claude-code` |

## キーボード・入力

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Karabiner-Elements](https://karabiner-elements.pqrs.org/)** `[dotfiles管理]` | キーボードカスタマイズ。CapsLock→Ctrl変換、Ctrl+hjklで矢印キー等 | `brew install --cask karabiner-elements` |
| **[Google 日本語入力](https://www.google.co.jp/ime/)** | Google製の日本語IME | `brew install --cask google-japanese-ime` |

## コンテナ・仮想化

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[OrbStack](https://orbstack.dev/)** | Docker Desktop代替。軽量・高速なコンテナ/Linux VM環境 | `brew install --cask orbstack` |

## JavaScript/Node.js ランタイム管理

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[nvm](https://github.com/nvm-sh/nvm)** | Node.jsバージョン管理。プロジェクト毎にNode.jsバージョンを切替 | `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh \| bash` |
| **[nodebrew](https://github.com/hokaccha/nodebrew)** | 日本製のNode.jsバージョン管理ツール | `brew install nodebrew` |
| **[Bun](https://bun.sh/)** | 超高速JavaScript runtime/package manager。Node.js互換 | `curl -fsSL https://bun.sh/install \| bash` |

## モバイル開発

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[CocoaPods](https://cocoapods.org/)** | iOS依存関係管理 | `brew install cocoapods` |
| **[Watchman](https://facebook.github.io/watchman/)** | ファイル変更監視。React Nativeで必要 | `brew install watchman` |

## ネットワーク・API

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[ngrok](https://ngrok.com/)** | ローカルサーバーを外部公開するトンネリングツール | `brew install --cask ngrok` |
| **[wget](https://www.gnu.org/software/wget/)** | ファイルダウンロードツール | `brew install wget` |

## 生産性・コラボレーション

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Alfred](https://www.alfredapp.com/)** | ランチャー兼生産性ツール。Spotlight代替 | `brew install --cask alfred` |
| **[Notion](https://www.notion.so/)** | ドキュメント・ナレッジ管理 | `brew install --cask notion` |
| **[Obsidian](https://obsidian.md/)** | Markdownベースのローカルナレッジ管理 | `brew install --cask obsidian` |
| **[Figma](https://www.figma.com/)** | UIデザインツール | `brew install --cask figma` |
| **[Miro](https://miro.com/)** | オンラインホワイトボード | `brew install --cask miro` |
| **[TickTick](https://ticktick.com/)** | タスク管理・To-Doアプリ | `brew install --cask ticktick` |

## コミュニケーション

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Slack](https://slack.com/)** | チームコミュニケーション | `brew install --cask slack` |
| **[Zoom](https://zoom.us/)** | ビデオ会議 | `brew install --cask zoom` |
| **[Gather](https://www.gather.town/)** | バーチャルオフィス | `brew install --cask gather` |

## スクリーンショット・画像

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[CleanShot X](https://cleanshot.com/)** | 高機能スクリーンショット。スクロールキャプチャ・注釈・GIF録画 | `brew install --cask cleanshot` |
| **[Skitch](https://evernote.com/products/skitch)** | シンプルなスクリーンショット・注釈ツール | `brew install --cask skitch` |

## 翻訳

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[DeepL](https://www.deepl.com/)** | 高精度な機械翻訳。ショートカットで即翻訳 | `brew install --cask deepl` |

## セキュリティ

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[1Password](https://1password.com/)** | パスワードマネージャー | `brew install --cask 1password` |

## ブラウザ

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Google Chrome](https://www.google.com/chrome/)** | メインブラウザ。DevToolsでのデバッグに必須 | `brew install --cask google-chrome` |

## その他

| ツール | 説明 | インストール |
|--------|------|-------------|
| **[Spotify](https://www.spotify.com/)** | 音楽ストリーミング。コーディングのお供に | `brew install --cask spotify` |
| **[jq](https://stedolan.github.io/jq/)** | JSONプロセッサ。APIレスポンスの整形に便利 | `brew install jq` |
| **[mas](https://github.com/mas-cli/mas)** | Mac App StoreのCLIツール | `brew install mas` |

---

## 一括セットアップ

Homebrewがインストールされていれば、Brewfileで一括インストールできます：

```bash
# Brewfileから全ツールをインストール
brew bundle --file=Brewfile

# VSCode拡張機能もBrewfileに含まれています
```

## Karabiner設定のポイント

現在の設定:
- **CapsLock → Left Control**: Ctrlキーをホームポジションから押せるようにする
- **Left Ctrl + h/j/k/l → 矢印キー**: Vimライクなカーソル移動をシステム全体で使える

## Cursor設定のポイント

現在の設定:
- **Vim拡張**: EasyMotion有効、`jj`でノーマルモードへ、Leader=Space
- **テーマ**: Night Owl (No Italics)
- **EditorJumper**: Cursor↔JetBrains IDE間のファイルジャンプ
- **キーバインド**: `f`でJumpy2、`Ctrl+Alt+d`でVimモードトグル
