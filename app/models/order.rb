class Order < ActiveRecord::Base

  belongs_to :users
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  validates :email, presence: true

end
