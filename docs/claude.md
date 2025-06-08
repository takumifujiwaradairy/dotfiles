# Claude Code

[Claude Code](https://github.com/anthropic-ai/claude-code)は、AnthropicのClaude AIをコマンドラインから直接利用できるツールです。コード生成、デバッグ、レビュー、リファクタリングなどの開発作業を効率化できます。

## 特徴

- 🤖 **AI支援開発**: Claude AIによる高度なコード生成・分析
- 💻 **コマンドライン統合**: ターミナルから直接AI機能を活用
- 🔄 **Git統合**: コミットメッセージ生成、コードレビューの自動化
- 📁 **ファイル操作**: 複数ファイルの同時分析・編集
- 🎯 **プロジェクト分析**: プロジェクト全体の構造理解と提案

## システム要件

- **Node.js 18以上**
- **macOS 10.15+、Ubuntu 20.04+/Debian 10+、またはWindows（WSL経由）**
- **インターネット接続**
- **Anthropic Console アカウント**（課金アカウント）または**Claude App（Maxプラン）**

## インストール

### npm経由でのインストール
```bash
npm install -g @anthropic-ai/claude-code
```

### トラブルシューティング
```bash
# npmキャッシュをクリア
npm cache clean --force

# 再度インストールを試行
npm install -g @anthropic-ai/claude-code

# npxで直接実行（インストールに問題がある場合）
npx @anthropic-ai/claude-code
```

## 初期設定

### 認証設定
```bash
# 初回起動で認証設定
claude
```

認証オプション：
- **Anthropic Console**: デフォルトオプション（課金アカウントが必要）
- **Claude App（Maxプラン）**: MaxプランでClaudeアプリアカウントを使用

## 基本的な使い方

### コマンドライン基本操作
```bash
# 質問をする
claude ask "このコードを説明して" main.py

# ファイルを編集
claude edit "エラーハンドリングを追加して" script.js

# チャットモード
claude chat

# コード生成
claude code "Pythonでクイックソートを実装して"
```

## 設定済みエイリアス

この設定では以下のエイリアスが利用可能です：

### 基本コマンド
- `c` / `claude` - Claude Codeを起動
- `cedit` - ファイルを編集
- `cask` - 質問する
- `cchat` - チャットモード

### 開発支援
- `cdebug` - デバッグ支援
- `crefactor` - リファクタリング支援
- `ccomment` - コメント追加
- `cdoc` - ドキュメント生成

### Git統合
- `ccommit` - コミットメッセージ生成
- `creview` - コミットレビュー
- `cgit` - Git状態説明

### コード品質
- `clint` - リンター設定提案
- `csecurity` - セキュリティチェック
- `cperformance` - パフォーマンス改善

## 便利な関数

### ファイル操作
```bash
# 単一ファイルを分析
cfile main.py "このファイルの機能を説明して"

# 複数ファイルを分析
cfiles src/*.py "このモジュールの設計を分析して"

# プロジェクト全体を分析
cproject "このプロジェクトの構造と改善点を教えて"
```

### Git操作
```bash
# 差分をレビュー
cdiff staged "この変更をレビューして"
cdiff unstaged "この変更の影響を分析して"
cdiff last "前回のコミットを確認して"
```

### エラー解決
```bash
# エラーメッセージを分析
cerror "undefined method error"

# ログファイルを分析
cerror error.log
```

### プロジェクト分析
```bash
# ディレクトリ構造を分析
cdir "このディレクトリ構造の問題点は？"

# ヘルプを表示
chelp

# ステータス確認
cstatus
```

## 実用的な使用例

### 1. コード開発フロー
```bash
# 新機能の実装
claude ask "ユーザー認証機能をPythonで実装する方法"

# 実装後のレビュー
cfile auth.py "このコードの改善点を教えて"

# Git準備
ccommit  # 適切なコミットメッセージを生成
```

### 2. デバッグ作業
```bash
# エラーの分析
cerror "AttributeError: 'NoneType' object has no attribute 'get'"

# コードの調査
cdebug  # 現在のコードをデバッグ支援で分析

# 修正の実装
cedit "nullチェックを追加して安全にして"
```

### 3. プロジェクト分析
```bash
# プロジェクトの全体把握
cproject

# 特定の機能の分析
cfiles models/*.py "このモデル設計の問題点は？"

# アーキテクチャの改善
clearn "このコードのデザインパターンを説明して"
```

### 4. コードレビュー
```bash
# ステージングエリアのレビュー
creview

# 特定の差分をレビュー
cdiff feature-branch "この機能の実装をレビューして"

# セキュリティチェック
csecurity
```

## Git統合設定

### .gitconfigへの追加設定
```bash
git config --global alias.claude-review "!claude ask 'このコミットをレビューして' $(git diff --cached)"
git config --global alias.claude-commit "!claude ask '適切なコミットメッセージを生成して' $(git diff --cached)"
git config --global alias.claude-explain "!claude ask 'この変更の意図を説明して' $(git show)"
```

## 高度な使用方法

### カスタム質問の作成
```bash
# 特定のプロジェクト用関数
project_analyze() {
    claude ask "このTypeScriptプロジェクトの型安全性を確認して" \
        package.json tsconfig.json src/**/*.ts
}

# パフォーマンス分析
perf_check() {
    claude ask "このコードのパフォーマンスボトルネックを特定して" "$@"
}
```

### プロジェクト設定の最適化
```bash
# プロジェクトディレクトリで設定を保存
echo "project_type: web-frontend
language: typescript
framework: react" > .claude-config.yaml
```

## エディタ統合

### Vim/Neovim統合
```vim
" Claude Code統合
command! -range ClaudeAsk call system('claude ask "' . input('Question: ') . '"')
command! -range ClaudeEdit call system('claude edit "' . input('Edit instruction: ') . '"')

" キーマッピング
nnoremap <leader>ca :ClaudeAsk<CR>
nnoremap <leader>ce :ClaudeEdit<CR>
```

### VS Code統合
```json
{
    "terminal.integrated.shellArgs.osx": [
        "-c", "source ~/.config/clauderc && exec zsh"
    ]
}
```

## トラブルシューティング

### インストールエラー
```bash
# Node.jsバージョン確認
node --version  # 18以上が必要

# 権限問題の場合
sudo npm install -g @anthropic-ai/claude-code

# npxで代替実行
npx @anthropic-ai/claude-code
```

### 認証エラー
```bash
# 認証情報をリセット
claude auth logout
claude auth login

# 設定確認
claude config show
```

### APIエラー
```bash
# ネットワーク接続確認
curl -I https://api.anthropic.com

# レート制限の確認
claude status
```

### 設定が読み込まれない
```bash
# シェル設定の確認
source ~/.config/clauderc

# エイリアス確認
alias | grep '^c'

# 環境変数確認
echo $CLAUDE_PROJECT_CONFIG
```

## ベストプラクティス

### 効果的な質問の仕方
1. **具体的に質問**: "このコードを改善して" より "このコードのパフォーマンスを改善して"
2. **コンテキストを提供**: ファイル名や関連コードも含める
3. **段階的に進める**: 大きな変更は小分けにして質問

### プロジェクト管理
1. **定期的なレビュー**: `cproject` で全体像を把握
2. **Git統合の活用**: `ccommit` と `creview` で品質向上
3. **エラー対応**: `cerror` で効率的なデバッグ

### セキュリティ注意事項
1. **機密情報の除外**: APIキーやパスワードを含むファイルは避ける
2. **プライベートプロジェクト**: 社内コードの取り扱いに注意
3. **ログの管理**: Claude Codeの通信ログを定期的に確認

## パフォーマンス最適化

### 大規模プロジェクトでの使用
```bash
# ファイル選択を最適化
cfiles src/main.* "メインファイルのみを分析"

# 特定の問題に集中
claude ask "この特定の関数のバグを見つけて" --file problematic_function.py
```

### レスポンス時間の改善
- 質問を具体的にして処理時間を短縮
- ファイルサイズが大きい場合は分割して送信
- キャッシュを活用（同じ質問は避ける）

Claude Codeを効果的に活用することで、開発効率が大幅に向上し、コード品質も改善されます！ 