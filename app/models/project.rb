class Project < ActiveRecord::Base
	# attr_accessible :title, :body
	attr_accessible :name, :position,:description, :user_id
	attr_accessible :avatar

	has_many :comments, :dependent => :destroy
	belongs_to :users

	# 	store pic in local folder
	# has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
	# 					:path => ":rails_root/public/assets/images/:id/:style/:filename",
	# 					:url => "/assets/images/:id/:style/:filename"

	has_attached_file :avatar,
	    :storage => :dropbox,
	    :styles => { :thumb => "150x150!",:medium => "300x300!" },
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    :path => ":style/:id_:filename"

	validates_attachment :avatar, :presence => true,
  		:size => { :in => 0..2.megabytes }
end
