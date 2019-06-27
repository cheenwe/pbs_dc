class Jz::User < ApplicationRecord
    SHIXI_NAME= ["马好亚", "黄璇琦", "刘俊飞"] 

    scope :shixi, ->{ where(name:SHIXI_NAME) }

    has_many  :records, class_name: "Jz::Record", dependent: :destroy
    has_many  :sxes, class_name: "Jz::Sx", dependent: :destroy

    before_create :gen_code

    def gen_code
        code = Jz::User.last.code.succ rescue "001"
    end


    def up_code
        i=1
        Jz::User.all.each do |user|
            user.update(code: i)
            i +=1
        end
    end
end
