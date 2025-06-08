# fzf (Fuzzy Finder)

[fzf](https://github.com/junegunn/fzf)は、コマンドライン用の高速なファジーファインダーです。ファイル、コマンド履歴、プロセスなどを効率的に検索・選択できます。

## 特徴

- ⚡ **高速**: Go言語製で非常に高速
- 🔍 **ファジー検索**: あいまい検索で素早く候補を絞り込み
- 🎨 **カスタマイズ可能**: 色、レイアウト、キーバインドを自由に設定
- 🔗 **統合性**: 様々なツールやエディタと連携
- 📋 **プレビュー機能**: 選択前にファイル内容を確認

## インストール

### Homebrew（macOS/Linux）
```bash
brew install fzf
```

### 推奨ツールの同時インストール
```bash
# fzfと相性の良いツールを一緒にインストール
brew install fzf bat ripgrep fd tree
```

## 基本的な使い方

### デフォルトキーバインド
| キー | 機能 |
|------|------|
| `Ctrl+T` | ファイル検索・挿入 |
| `Ctrl+R` | コマンド履歴検索 |
| `Alt+C` | ディレクトリ移動 |

### 基本操作
| キー | 機能 |
|------|------|
| `Enter` | 選択して確定 |
| `Esc` | キャンセル |
| `Tab` | 複数選択 |
| `Shift+Tab` | 選択解除 |
| `Ctrl+A` | 全て選択 |
| `Ctrl+D` | 全て選択解除 |
| `Ctrl+/` | プレビュー表示切り替え |

## 便利な関数とエイリアス

この設定では以下の関数が利用できます：

### ファイル操作
- `fe` / `ff` : ファイル検索＆エディタで開く
- `fcd` : ディレクトリ検索＆移動

### Git操作
- `fco` : ブランチ選択＆チェックアウト
- `flog` : Gitログをインタラクティブに表示
- `fshow` : Gitコミット差分を表示

### システム操作
- `fkill` : プロセス検索＆終了
- `fh` : コマンド履歴から選択実行
- `fenv` : 環境変数を検索

### その他
- `fssh` : SSH接続先を選択
- `fdocker` : Dockerコンテナに接続

## 使用例

### 基本的なファイル検索
```bash
# 現在のディレクトリからファイルを検索
fzf

# 特定のディレクトリからファイルを検索
find /path/to/directory -type f | fzf
```

### コマンドと組み合わせた使用
```bash
# ファイルを選択してVimで開く
vim $(fzf)

# 複数ファイルを選択してVimで開く
vim $(fzf -m)

# 選択したファイルをcatで表示
cat $(fzf)
```

### プロセス管理
```bash
# プロセスを検索して詳細を表示
ps aux | fzf

# 設定されたfkill関数を使用
fkill
```

### Git操作
```bash
# ブランチを選択してチェックアウト
fco

# インタラクティブなGitログ表示
flog

# 変更されたファイルを選択してgit add
git diff --name-only | fzf -m | xargs git add
```

## 高度な使用方法

### 検索演算子
| 演算子 | 意味 | 例 |
|--------|------|-----|
| `foo` | あいまい検索 | "foo" |
| `'foo` | 完全一致 | "'foo" |
| `^foo` | 前方一致 | "^foo" |
| `foo$` | 後方一致 | "foo$" |
| `!foo` | 否定 | "!foo" |

### 複合検索
```bash
# 複数条件での検索
fzf --query "^src !test .js$"

# OR条件での検索
fzf --query "foo | bar"
```

### プレビュー機能
```bash
# ファイルの内容をプレビュー
fzf --preview 'cat {}'

# 行番号付きでプレビュー
fzf --preview 'bat --color=always --line-range :500 {}'
```

## ripgrep との連携

ripgrepとの組み合わせで強力な検索が可能：

```bash
# ファイル内容を検索
rg --color=always --line-number --no-heading --smart-case "${*:-}" |
  fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
```

## Vim/Neovim との連携

### Vim設定例
```vim
" fzf.vim プラグインを使用
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" キーマッピング
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
```

## トラブルシューティング

### fzfが見つからない
```bash
# パスを確認
which fzf

# シェル統合を再インストール
$(brew --prefix)/opt/fzf/install
```

### プレビューが表示されない
```bash
# batがインストールされているか確認
which bat

# batをインストール
brew install bat
```

### キーバインドが効かない
```bash
# .zshrcにfzfの設定が読み込まれているか確認
source ~/.config/fzfrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

### 色が正しく表示されない
```bash
# ターミナルの色設定を確認
echo $TERM

# 256色サポートを確認
tput colors
```

## パフォーマンス最適化

### 大きなディレクトリでの高速化
```bash
# fdを使用（.gitignoreを考慮）
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# ripgrepを使用
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
```

### 除外パターンの設定
```bash
# 特定のファイルやディレクトリを除外
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .DS_Store'
```

## 実用的なワークフロー

### 開発作業での使用例

1. **ファイル編集**
   ```bash
   # プロジェクト内のファイルを素早く開く
   fe
   ```

2. **ブランチ切り替え**
   ```bash
   # 視覚的にブランチを選択
   fco
   ```

3. **コマンド履歴**
   ```bash
   # Ctrl+R でコマンド履歴を検索
   # 過去のコマンドを素早く再実行
   ```

4. **ディレクトリ移動**
   ```bash
   # Alt+C でディレクトリを選択移動
   # 深い階層も一発で移動
   ```

### 検索効率の向上

- **プレビュー機能を活用**: ファイルの中身を確認してから選択
- **複数選択**: Tabキーで複数ファイルを選択
- **検索演算子**: より精密な検索条件を指定
- **キーバインド**: 覚えやすいキーバインドを設定

## 設定のカスタマイズ

設定を変更したい場合は `fzf/fzfrc` を編集してください。

### 色の変更
```bash
# 独自の色設定
export FZF_DEFAULT_OPTS="
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
"
```

### キーバインドの追加
```bash
# カスタムキーバインドの例
export FZF_DEFAULT_OPTS="
  --bind='ctrl-u:preview-up'
  --bind='ctrl-d:preview-down'
  --bind='ctrl-f:preview-page-down'
  --bind='ctrl-b:preview-page-up'
"
```

fzfをマスターすることで、コマンドライン作業の効率が劇的に向上します！ 