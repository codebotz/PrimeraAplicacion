class Post < ActiveRecord::Base
	#include Paperclip::Glue
	#ApplicationRecord
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#"}, default_url: "/images/missing.png"
	#has_attached_file :image, styles: { :medium => "300x300>", :thumb => "100x100>" , original: "300x300>"}, default_url: "/images/missing.png"
	#, default_url: "/images/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
