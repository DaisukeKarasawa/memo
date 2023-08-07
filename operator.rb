# 演算子クラス
class Operator
    # ぼっち演算子
    def bocchi
        @age += 10
    end
end

# ユーザークラス
class User < Operator
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    # エラーハンドリング
    def nil_or_not
        return !(self&.bocchi).nil? ? "Success" : "Failed"
    end
end

user = User.new("Bob", 23, "man")
user2 = User.new("Alice", nil, "woman")
puts user.nil_or_not
puts user2.nil_or_not