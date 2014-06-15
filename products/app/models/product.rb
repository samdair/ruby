class Product < ActiveRecord::Base
  #before_destroy :ensure_not_referenced_by_any_line_item
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  CATEGORY_TYPES = ["Show all","Electronics","Food","Clothes"]
  has_attached_file :image,  :styles => { :small  => "150x150>" }
  
  def self.search(search)
  if search 
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  
  else
    find(:all)
  end
end


#...
 private
 # ensure that there are no line items referencing this product
 def ensure_not_referenced_by_any_line_item
   if line_items.empty?
     return true
     else
     errors.add(:base, 'Line Items present')
     return false
     end
   end
                  
end
