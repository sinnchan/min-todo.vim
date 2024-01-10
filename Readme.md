# min-todo.vim

シンプルな TODO 管理用のツールです。

## 利用イメージ

マークダウン形式のチェックファイルを vim 上で管理するためのちょっと便利なコマンドを提供します。

タスクの作成(imap でショートカット登録しています)

> - [ ] hoge

タスクの終了・未了状態の切り替え

> - [ ] hoge

⬇️⬇️⬇️

> - [x] `yyyy-MM-dd hh:mm` hoge

処理済みタスクのアーカイブ

> ## todo
> - [x] `yyyy-MM-dd hh:mm` hoge
> - [ ] piyo
> 
> ## archives

⬇️⬇️⬇️

> ## todo
> - [ ] piyo
> 
> ## archives
> - [x] `yyyy-MM-dd hh:mm` hoge

## 使用方法

デフォルトのキーマッピングはありません。

お好みに合わせてキーを以下のようにマッピングしてください

```vim
" ノーマルモード中のチェックボックスの未了・終了の切り替え
nnoremap <C-c> :ToggleTask<CR>
" インサートモード中の新規タスクの作成
imap <C-c> <ESC>:CreateTask<CR>A
" すぐにタスク管理用ファイルが開けるようにショートカット登録
nnoremap <Leader>t :tabe ~/todo.md<CR>
```

ヘルプは確認する場合は `:h min-todo` を実行してください。
