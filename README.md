# 百合鏡データ小屋　表示用Railsアプリ
百合鏡データ小屋は[百合鏡](http://csyuki.sakura.ne.jp/cgi-bin/prism/)を解析して得られるデータを扱った情報サイトです。  
このプログラムは百合鏡データ小屋で実際に使用している表示用のRailsアプリです。  
データ小屋の解析部分については[別リポジトリ](https://github.com/white-mns/yurikagami_parse)を参照ください。

# サイト
実際に動いているサイトです。  
[百合鏡データ小屋](http://tkg.mn-s.net/yk_4)

# 動作環境
以下の環境での動作を確認しています  
  
CentOS Linux release 8.2.2004  
DB:MySQL 8.0.21  
Ruby:2.7.1  
Rails:6.x  
gcc:8.3.1

## 使い方
・Railsの使い方を調べてなんやかんやして自分のRailsアプリが動くようにします。  
・このソースコードをダウンロードします。  

    git clone git://github.com/white-mns/yurikagami_rails.git

・動かします。  

    cd yurikagami_rails
    bundle install
 
・DBを作成し、必要なテーブルの設定を行います。
 
    bundle exec rake db:create
    bundle exec rake db:migrate
    ./unicorn start
    
他の方法でRailsが動かせるならUnicornである必要はありません。  
データ小屋は開発環境をUnicorn(アプリ一つずつ再起動できるため)、本番環境をPassenger（しばらく利用されてないアプリは眠らせられるため）としています。
デフォルトの設定だと`http://サーバーのアドレス:61000`で画面が見れます。

## 動かない場合
・権限が足りない  
・Cのコンパイラ等が古い  
などの可能性が考えられます。

### 権限が足りない
所有者をユーザーapache、グループusersにします。

    chown -R apache:users ./
  
そして、編集しやすくするために等で普段使うユーザーをusersに追加します。

    usermod -aG グループ名 ユーザー名
    
ユーザーがグループに所属していたら書き込みできるようにします。  
グループへの権限追加なのでセキュリティ的にも問題はないと思っています。

    chmod g+w ./ -r

### Cのコンパイラ等が古い

例えば、gcc 4.4.7では一部のgemのインストールがうまくいきませんでした。  
5.2.1に上げれば動作することを確認しています。

データ小屋はCentOSを使っているので、[Developer Toolset 7 &mdash; Software Collections](https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/)でgccのバージョンを上げました。

## 機能の増やし方
scaffoldで必要なものは大体用意されます。  
データ小屋ではテンプレートを使うようにしているので、  
`lib/templates/erb/scaffold/index.html.erb`を参考にデータ小屋っぽいViewが、  
`lib/templates/rails/scaffold_controller/controller.rb`を参考にデータ小屋用のControllerが作成されます。  

    rails scaffold g テーブル名 result_no:integer generator_no:integer e_no:integer その他パラメーター

また、Modelはテンプレートで作成できなかったので、以下の行をModelの中に記述します。  
これでキャラクター名が関連付けられるようになります。

	belongs_to :p_name,	:foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'

あとは[解析プログラム](https://github.com/white-mns/yurikagami_parse)側に圧縮ファイルを用意し、解析とアップロード機能を追加してデータを入れれば新しい解析項目が公開されます。

## ライセンス
本ソフトウェアはMIT Licenceを採用しています。 ライセンスの詳細については`LICENSE`ファイルを参照してください。
