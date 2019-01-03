class Sale < ApplicationRecord
  
 validates :cod, uniqueness: true
# validates :detail, presence: true
# validates :category, inclusion: { in: %w(uno dos tres cuatro cinco),
#     message: "%{category} is not valid" }, allow_nil: true

# validates :value, numericality: { message: "%{value} seems wrong"}

# validates :discount, numericality: { less_than_or_equal_to: 40}

end
