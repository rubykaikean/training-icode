class Massage < ActiveRecord::Base

	validates :post_id , presence: true

  belongs_to :post
  belongs_to :user
end
