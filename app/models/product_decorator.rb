Product.class_eval do
    
  def highlighted?
    not highlighted_at.blank?
  end
  
end