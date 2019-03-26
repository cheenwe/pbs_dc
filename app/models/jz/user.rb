class Jz::User < ApplicationRecord
    has_many  :records, class_name: "Jz::Record", dependent: :destroy

    before_create :gen_code

    def gen_code
        code = Jz::User.last.code.succ
    end


    def up_code
        i=1
        Jz::User.all.each do |user|
            user.update(code: i)
            i +=1
        end
    end
end
