class Comment < ActiveRecord::Base
  belongs_to :product
  RATE_TYPES =[1,2,3,4,5]
end
