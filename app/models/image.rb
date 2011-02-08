class Image < ActiveRecord::Base
  has_attachment :content_type => :image, :storage => :file_system, 
  :thumbnails => {:small =>'20x15>', :thumb => '50x50>'}, :path_prefix => "public/images/employees"
  
  belongs_to :employee#, :polymorphic => true
  
  belongs_to :parent, :class_name => 'Image'
  has_many :thumbnails, :class_name => 'Image', :foreign_key => 'parent_id', :dependent => :destroy
end
