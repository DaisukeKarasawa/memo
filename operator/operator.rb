class User
    attr_accessor :age

    def initialize(age)
        @age = age
    end
end

class Operator

    # userがnilの場合はデフォルトでインスタンスを作成する（ぼっち演算子）
    def self.bocci(user)
        if !user&.age.nil?
            return user.age
        else
            user = User.new(20)     # デフォルト作成
            return user.age
        end
    end

    # userがnilの場合はデフォルトでインスタンスを作成する（論理和）
    def self.logical(user)
        user ||= User.new(20)
        return user.age
    end
end

user = nil
user2 = nil

puts Operator.bocci(user)           # 20
puts Operator.logical(user2)        # 20