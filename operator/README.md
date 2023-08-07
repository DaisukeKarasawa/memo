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

## 論理演算子 ||

