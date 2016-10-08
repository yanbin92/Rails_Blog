class Article < ApplicationRecord
	has_many :comments,
	dependent: :destroy#删除关联对象
    #添加数据验证
    validates :title,presence: true,
		    length:{minimum:5}
 	#http://guides.ruby-china.org/active_record_validations.htmls
		  
end
