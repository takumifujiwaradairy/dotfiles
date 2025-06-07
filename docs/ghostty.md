# Ghostty

## 概要

Ghosttyは、Mitchell Hashimoto（HashiCorpの創設者）により開発された、高速で現代的なターミナルエミュレータです。パフォーマンスと使いやすさを重視して設計されており、macOS、Linux、Windows で利用できます。

## 主な特徴

### 🚀 パフォーマンス
- **GPU加速レンダリング**: 高速なテキスト描画とスクロール
- **低レイテンシ**: 入力から表示までの遅延を最小化
- **効率的なメモリ使用**: 大量のスクロールバックでも軽快な動作

## インストール方法

### Homebrew（macOS）
```bash
$ brew install --cask ghostty
```

## 設定ファイル

Ghosttyの設定は、以下の場所に配置される設定ファイルで管理されます：

### 設定ファイルの場所
```
~/.config/ghostty/config
```

### dotfilesでの管理

このリポジトリでは、Ghosttyの設定を `ghostty/config` で管理しています。
`./install.sh` を実行することで、自動的にシンボリックリンクが作成されます。

```bash
# セットアップスクリプトの実行
./install.sh
```

### 現在の設定内容

```ini
# テーマ設定
theme = nord

# macOS固有設定
macos-titlebar-proxy-icon = hidden

# ウィンドウ設定
window-save-state = always
fullscreen = true
window-inherit-working-directory = true

# リサイズオーバーレイ設定
resize-overlay = never

# フォント設定（推奨）
font-family = "JetBrains Mono"
font-size = 13

# その他の推奨設定
scrollback-limit = 50000
cursor-blink = false
window-padding-x = 8
window-padding-y = 8
```

### 設定の説明

| 設定項目 | 値 | 説明 |
|---------|-----|------|
| `theme` | `nord` | Nord カラーテーマを使用 |
| `macos-titlebar-proxy-icon` | `hidden` | macOSのタイトルバーのプロキシアイコンを非表示 |
| `window-save-state` | `always` | ウィンドウの状態を常に保存 |
| `fullscreen` | `true` | フルスクリーンモードで起動 |
| `window-inherit-working-directory` | `true` | 新しいウィンドウで作業ディレクトリを継承 |
| `resize-overlay` | `never` | リサイズ時のオーバーレイを非表示 |


## 便利なショートカット

| 機能 | macOS | Linux/Windows |
|------|-------|---------------|
| 新しいタブ | `Cmd + T` | `Ctrl + Shift + T` |
| タブを閉じる | `Cmd + W` | `Ctrl + Shift + W` |
| 水平分割 | `Cmd + D` | `Ctrl + Shift + D` |
| 垂直分割 | `Cmd + Shift + D` | `Ctrl + Shift + Alt + D` |
| 検索 | `Cmd + F` | `Ctrl + Shift + F` |



## 関連リンク

- [公式サイト](https://ghostty.org/)
- [GitHub リポジトリ](https://github.com/ghostty-org/ghostty)
- [ドキュメント](https://ghostty.org/docs/)

## 更新履歴
- 2025-06-08: 初期ドキュメント作成 