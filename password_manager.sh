#!/bin/bash

# メッセージの表示
echo 'パスワードマネージャーへようこそ！'

# Exitが入力されるまでプログラムを終了せず選択肢を繰り返し表示
while true; do
  echo '次の選択肢から入力してください(Add Password/Get Password/Exit)：'
  read choice

  # Add Passwordが入力された場合
  case "$choice" in
    "Add Password")
      # 各情報の入力
      echo 'サービス名を入力してください：'
      read service_name

      echo 'ユーザー名を入力してください：'
      read user_name

      echo 'パスワードを入力してください：'
      read password

      echo 'パスワードの追加は成功しました。'

      # 入力された情報を指定形式でファイルに保存
      echo "$service_name:$user_name:$password" >> password_manager.txt
      ;;
    # Get Passwordが入力された場合
    "Get Password")
    echo 'Get Passwordが出力されることの確認'
      ;;
    # Exitが入力された場合
    "Exit")
      echo 'Thank you!'
      break
      # プログラムの終了
      ;;
    # Add Password/Get Password/Exit 以外が入力された場合
    *)
      echo '入力が間違えています。Add Password/Get Password/Exit から入力してください。'
      ;;
  esac
done
