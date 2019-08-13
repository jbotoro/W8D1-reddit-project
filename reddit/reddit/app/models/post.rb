class Post < ApplicationRecord

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  # belongs_to :sub,
  # foreign_key: :sub_id,
  # class_name: :Sub

  has_many :postsubs
  # foreign_key: :post_id,
  # class_name: :Postsub,
  # inverse_of: :post

  has_many :subs,
  through: :postsubs

  has_many :comments

  
  
end
