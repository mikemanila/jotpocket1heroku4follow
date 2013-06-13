class Category < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  has_many :themes, dependent: :destroy
end

