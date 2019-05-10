class Jz::User < ApplicationRecord
    SHIXI_ID= [11, 19, 71, 25, 94, 89, 96, 36] 

    scope :shixi, ->{ where(id:SHIXI_ID) }

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
