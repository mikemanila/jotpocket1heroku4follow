class Theme < ActiveRecord::Base
  attr_accessible :category, :color, :name, :category_id
    
  belongs_to :category
  belongs_to :user
  has_many :pieces, dependent: :destroy
  
  validates :user_id, presence: true
  #validates :category_id, presence: true
end

