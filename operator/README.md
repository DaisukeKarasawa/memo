# 演算子

## ぼっち演算子 &.

レシーバが、特定のクラスのインスタンス、もしくは nil のいづれかであり、レシーバが nil の場合には、メソッドを呼び出さずに nil を返すことができる。

通常、レシーバが持っていないメソッドを使おうとすると `NoMethodError` が発生する。

```
puts nil.reverse      # undefined method `reverse' for nil:NilClass (NoMethodError)
```

しかし、レシーバが nil の場合にぼっち演算子 `&.` を使用して `オブジェクト&.メソッド` の形でメソッドを呼び出すことで、`NoMethodError` を回避して nil を返すことができる。

```
puts nil&.reverse       # nil
```

ぼっち演算子を使って以下のように、nil の場合でもエラーを回避した上でハンドリングすることができる。

```
def operator(string)
    !(answer = string&.reverse).nil? ? answer : "Argument was nil"
end

puts operator("Ruby")       # ybuR
puts operator(nil)          # Argument was nil
```

**注意点**

同じ `NoMethodError` でも、クラスを跨いだメソッドの使用によるエラーは回避できない。

```
puts 100&.upcase        # undefined method `upcase' for 100:Integer (NoMethodError)
```

## 論理演算子: 論理和 ||

左辺から評価し、左辺が偽の場合は右辺の評価する。左辺が真の場合その時点で左辺の値を返す。

`||` の挙動を利用することで、変数が偽または未定義の時にデフォルト値を設定することができる。

```
# A || B が成立するパターン

A = true, B = true      # 両方がtrue
A = true, B = false     # 片方がtrue
A = false, B = true     # 片方がtrue
```

論理和は以下のような使い方ができる。

```
# if文の条件
n = 100
if n == 100 || n == 0
    puts "n の値は、100と0のどちらかです。"
end

# 変数代入1
# 最初に真と評価された値が代入される
n = nil || false || 100 || true
puts n               # 100

# 変数代入2
n || (n == 0)
puts n              # 0
```

上記の `# 変数代入2` は、以下のように書き換えることができる。

```
# n || (n == 0) と同じ
n ||= 0
puts n      # 0
```
