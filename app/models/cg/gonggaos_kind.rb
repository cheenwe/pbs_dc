class Cg::GonggaosKind < ApplicationRecord

    belongs_to :kind, class_name: "Cg::Kind", :foreign_key => :kind_id
    belongs_to :gonggao, class_name: "Cg::Gonggao", :foreign_key => :gonggao_id
end
