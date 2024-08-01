最新のPythonを使用していることを確認してください。

プログラムをテストする前に、次のフレームワークとパッケージをインストールしてください:
```
    pip install Flask

    pip install Flask-SQLAlchemy
    
    pip install psycopg2-binary
    
    pip install flask_login
```
このウェブアプリではPosgreSQLを使用していますので、以下のリンクからPosgreSQLをダウンロードしてください：
```
    https://www.postgresql.org/download/.
```
PosgreSQLをインストールした後、データベースを作成し、`data_vocab_v2.sql`ファイルのコードを実行してください。

`__init__.py`ファイルの次の行のコードを編集する必要があります：
```
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:ryhoangf@localhost/goikanji_db'
```
以下の構文で：
```
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:your password@localhost/your database name'
```
最後に、`main.py`ファイルを実行してプログラムを使用してみてください。

デモビデオ：
```
    https://drive.google.com/file/d/1KFPHlBEIqW6jflmphGkkFVQXISulyADR/view?usp=sharing
```

Make sure that the Python you are using is the latest version.

Please install the following frameworks and packages before you test the program:
```
    pip install Flask

    pip install Flask-SQLAlchemy
    
    pip install psycopg2-binary
    
    pip install flask_login
```
We're using PosgreSQL for this web app, you can download this at:
```
    https://www.postgresql.org/download/.
```
After installing PosgreSQL, please create a database and run the code in the file `data_vocab_v2.sql` .

You need to edit the following line of code in the `__init__.py` file:
```
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:ryhoangf@localhost/goikanji_db'
```   
with the following syntax:
```
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:your password@localhost/your database name'
```
Finally, try running the `main.py` file to use the program.

Demo Video:
```
    https://drive.google.com/file/d/1KFPHlBEIqW6jflmphGkkFVQXISulyADR/view?usp=sharing
```
