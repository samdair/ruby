class Article < ActiveRecord::Base
   acts_as_commentable
  has_many :comments, :as => :commentable, :dependent => :destroy
  belongs_to :user
  
  has_attached_file :photo, {
    :styles => {
      :thumb => ["50x50#", :png],
      :medium => ["100x100#", :png],
      :large => ["300x300>", :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :thumb => "-gravity Center -crop 100x100+0+0",
    }
  }
  def owned_by?(owner)
    return false unless owner.is_a?(User)
    user == owner
  end
end
