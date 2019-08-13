class Sub < ApplicationRecord

  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: :User 

  has_many :postsubs
  # foreign_key: :sub_id,
  # class_name: :Postsub,
  # inverse_of: :sub

  has_many :posts,
  through: :postsubs

end
