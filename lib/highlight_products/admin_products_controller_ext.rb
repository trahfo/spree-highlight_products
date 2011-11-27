module HighlightProducts
  module AdminProductsControllerExt
    def self.included(base)
      base.class_eval do
        
        update.before :handle_highlighted
        
        def highlight
          @product.highlight
          flash[:notice] = t("highlight_products.product_has_been_highlighted")
          redirect_to admin_products_url
        end

        def unhighlight
          @product.unhighlight
          flash[:notice] = t("highlight_products.product_has_been_unhighlighted")
          redirect_to admin_products_url
        end
        
        def highlighted
          @products = Product.highlighted
          if params[:limit]
            @products = @products.offset(params[:limit].to_i);
          elsif params[:older_than]
            @products = @products.where('products.highlighted_at < ?', params[:older_than].to_i.day.ago)
          end
          @products.each(&:unhighlight)
          flash[:notice] = t("highlight_products.products_have_been_unhighlighted", :count => @products.length)
          unless request.authorization.blank?
            render :text => flash[:notice]
          else
            redirect_to admin_products_url
          end
        end
        
        protected
        
        def handle_highlighted
          if (params[:product] || {}).delete(:highlighted).blank?
            @product.unhighlight
          else
            @product.highlight
          end
        end
        
      end
    end
  end
end
