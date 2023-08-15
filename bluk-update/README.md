# insert_all/upsert_all

## insert_all

単一の SQL 文で複数のレコードをデータベースに一括登録する。直接実行するので、ActiveRecord のコールバックやバリデーションをトリガーしない。また、パラメータはハッシュで渡す必要がある。

**注意点**

- NOT NULL 制約がついているカラムは明示的に指定する必要がある。

- 配列内の Hash の構造は全て一致させる必要がある。

```ruby
# モデル.insert_all(パラメータ)

users = [
    # ハッシュ形式でタイムスタンプも指定
    { id: 1, name: "John", age: 20, created_at: Time.current, updated_at: Time.current },
    { id: 2, name: "Alice", age: 20, created_at: Time.current, updated_at: Time.current }
]
User.insert_all(users)
```

## upsert_all

単一の SQL 分で複数のレコードをデータベースに更新または挿入する。ActiveRecord のコールバックやバリデーションをトリガーしない。また、パラメータはハッシュで渡す必要がある。

```ruby
# モデル.upsert_all(パラメータ)

users = [
    { id: 1, name: "John", age: 20, hobby: "baseball", created_at: Time.current, updated_at: Time.current },
    # 構造一致のために hobby: nil を記述する必要がある
    { id: 2, name: "Alice", age: 20, hobby: nil, created_at: Time.current, updated_at: Time.current }
]
User.upsert_all(users)
```

**注意点**

- 配列内の Hash の構造は全て一致させる必要がある。

- 一意のカラムが重複したものは Updata され、重複していないものは Insert される。

  CREATE でも UPDATE でも問題ない SQL 文である必要がある。
