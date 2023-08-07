class User
    attr_reader :age

    def initialize(age)
        @age = age
    end
end

# userがnilの場合はデフォルトでインスタンスを作成する
def operator(user)
    if !user&.age.nil?
        return user.age
    else
        user = User.new(20)     # デフォルト作成
        return user.age
    end
end

user = nil
puts operator(user)