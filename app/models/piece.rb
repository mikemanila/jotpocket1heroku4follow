class Piece < ActiveRecord::Base
  attr_accessible :content, :name, :reference, :theme_id, :user_id, :photo, :photo_cache
  
  
  belongs_to :theme
  belongs_to :user
  
  #has_attached_file :photo
  
  # Added for s3 -> this method associates the attribute ":photo" with a file attachment
  has_attached_file :photo,
    :storage => :s3,
     :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
     # if you're using Rails 3.x, please use #{Rails.root.to_s} instead of #{RAILS_ROOT}
     :path => "/:style/:id/:filename",
     :url  => ":s3_sg_url" # if you're using eu buckets, call it s3_eu_url
  

  
  validates :user_id, presence: true
  #mount_uploader :photo, PhotoUploader
end
