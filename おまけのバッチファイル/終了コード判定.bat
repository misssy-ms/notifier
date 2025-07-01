@echo off
rem (c) 2025 misssy-ms All rights reserved. Version 1.1
setlocal
set /p argument=確認する引数を入力してください:
set /p var=引数:%argument%で実行します｡notifier.exeがあることを確認してください｡
start /wait notifier.exe %argument%
set code=%errorlevel%
if %code%==0 (
  echo 終了コード: %code%
  echo 正常に終了しました｡
  echo エラー: ありません｡
  echo ユーザーアクション: ありません｡
) else if %code%==11 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: アイコンを使用できませんでした｡ファイルパスの確認をしてください｡
  echo ユーザーアクション: ありません｡
  echo [TIP] .icoファイルはサポートしていません｡.pngを使用してください｡
) else if %code%==12 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: 画像を使用できませんでした｡ファイルパスの確認をしてください｡
  echo ユーザーアクション: ありません｡
) else if %code%==13 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: オーディオファイルを使用できませんでした｡ファイルパスの確認をしてください｡
  echo ユーザーアクション: ありません｡
  echo [TIP] ファイル形式は".wav"が推奨されます｡
) else if %code%==14 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: 不明なエラーです｡通知を送信できませんでした｡
  echo ユーザーアクション: ありません｡
  echo [TIP] 実行しているPCが要件を満たしていることを確認してください｡
) else if %code%==15 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: 不正な引数｡headeridの値は1000以上である必要があります｡
  echo ユーザーアクション: ありません｡
  echo [TIP] ソースコードを変更して999以下を使用できるようになります｡
) else if %code%==16 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: 不明な引数です｡通知を送信できませんでした｡
  echo ユーザーアクション: ありません｡
) else if %code%==17 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: 不明なエラーです｡通知の動作を判定できませんでした｡
  echo ユーザーアクション: ありません｡
) else if %code%==18 (
  echo 終了コード: %code%
  echo 問題が発生したため､通知を送信できませんでした｡
  echo エラー: テキストボックスの内容を出力できませんでした｡通知は送信されました｡
  echo ユーザーアクション: ありません｡
) else if %code%==20 (
  echo 終了コード: %code%
  echo 問題なく送信され､テキストボックスの内容を出力できました｡
  echo エラー: ありません｡
  echo ユーザーアクション: テキストボックスの内容^(notifier.txt^)
  type notifier.txt || echo ファイルを読み込めません｡ファイルが存在しない場合はnotifierに問題がある可能性があります｡
  echo [TIP] 文字化けしている場合はエンコードが間違っている可能性があります｡"--shiftjis"を追加してください｡
) else if %code%==21 (
  echo 終了コード: %code%
  echo 問題なく送信され､ボタンをクリックしました｡
  echo エラー: ありません｡
  echo ユーザーアクション: ボタン1^(btn1^)をクリック
) else if %code%==22 (
  echo 終了コード: %code%
  echo 問題なく送信され､ボタンをクリックしました｡
  echo エラー: ありません｡
  echo ユーザーアクション: ボタン2^(btn2^)をクリック
) else if %code%==23 (
  echo 終了コード: %code%
  echo 問題なく送信され､ボタンをクリックしました｡
  echo エラー: ありません｡
  echo ユーザーアクション: ボタン3^(btn3^)をクリック
) else if %code%==24 (
  echo 終了コード: %code%
  echo 問題なく送信され､ボタンをクリックしました｡
  echo エラー: ありません｡
  echo ユーザーアクション: ボタン4^(btn4^)をクリック
) else (
  echo [ERROR] 不明な終了コード:%code%
  echo [TIP] taskkillなどで強制終了されている可能性があります｡
)
pause
endlocal
exit /b
