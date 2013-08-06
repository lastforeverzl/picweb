class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :position,:description

  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  					:path => ":rails_root/public/assets/images/:id/:style/:filename",
  					:url => "/assets/images/:id/:style/:filename"
end
