# try/try!メソッド

## try メソッド

実行したオブジェクトに指定したメソッドが存在すればその戻り値を返し、メソッドが存在しなければ nil を返す。

- 使用ケース

  指定したメソッドがない場合にエラーを発生させたくない

  try メソッドを実行するオブジェクトが nil だった場合にエラーを発生させたくない

```ruby
# オブジェクト.try(:メソッド名)

# 存在する場合
user_name = User.first.try(:name)
puts user_name          # John

# 存在しない場合
user_hoge = User.first.try(:hoge)
puts user_hoge          # nil

# オブジェクトがnil
object_nil = nil.try(:name)
puts object_nil         # nil
```

**注意点**

発生すべきエラーを全て回避してしまい、バグに気付きづらい。

## try!メソッド

基本的に try メソッドと同じだが、メソッドが存在しない場合は NoMethodError が発生する。

```ruby
# 存在する場合
user_name = User.first.try!(:name)
puts user_name          # John

# 存在しない場合
user_hoge = User.first.try!(:hoge)
puts user_hoge          #

# オブジェクトがnil
object_nil = nil.try!(:name)
puts object_nil         # nil
```

## ぼっち演算子との違い

`try`メソッドは Rails の ActiveSupport で定義されていて、`&.`は Ruby に定義されている。従って、Rails を導入していない限りは`try`メソッドを使用できない。

## ぼっち演算子を使うべき理由

- `&.`の方が速度が速い

- 記述量が少なく、可読性が高い
