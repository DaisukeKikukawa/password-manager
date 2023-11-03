#!/bin/bash

echo 'パスワードマネージャーへようこそ！'

#各情報の入力
echo 'サービス名を入力してください：'
read service_name

echo 'ユーザー名を入力してください：'
read user_name

echo 'パスワードを入力してください：'
read password

#入力された情報を指定形式でファイルに保存
echo "$service_name:$user_name:$password" >> password_manager.txt

echo 'Thank you!'
