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
    echo 'サービス名を入力してください：'
    read service_name

    # 入力されたサービス名に一致する情報を取得
    service_info=$(grep -E "^$service_name:" password_manager.txt)

    # サービス名が保存されていた場合
    if grep -q -E "^$service_name:" password_manager.txt; then
        # サービス名、ユーザー名、パスワードを表示
        service_name=$(echo "$service_info" | cut -d ":" -f 1)
        username=$(echo "$service_info" | cut -d ":" -f 2)
        password=$(echo "$service_info" | cut -d ":" -f 3)

        echo "サービス名: $service_name"
        echo "ユーザー名: $username"
        echo "パスワード: $password"
      # echo 'サービス名あり'
    # サービス名が保存されていなかった場合
    else
      echo 'そのサービスは登録されていません。'
      # echo 'サービス名なし'
    fi
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
