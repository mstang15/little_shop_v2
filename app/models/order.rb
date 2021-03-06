class Order < ApplicationRecord
  validates_presence_of :status,
                        :user_id
  has_many :order_items
  has_many :items, through: :order_items
  #just for the customer
  belongs_to :user

  enum status: %w(pending complete canceled)

  def total_cost
    cost = order_items.sum("quantity * purchase_price")
  end

  def item_count
    count = order_items.sum(:quantity)
  end


end
