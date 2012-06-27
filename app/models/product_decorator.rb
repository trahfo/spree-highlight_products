Spree::Product.class_eval do
  
  attr_accessible :highlighted_at
    
  def highlighted?
    not highlighted_at.blank?
  end
  
end