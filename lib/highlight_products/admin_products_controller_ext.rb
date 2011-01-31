module HighlightProducts
  module AdminProductsControllerExt
    def self.included(base)
      base.class_eval do
        def highlight
          load_object
          @product.highlight
          flash[:notice] = t("highlight_products.product_has_been_highlighted")
          redirect_to admin_products_url
        end

        def unhighlight
          load_object
          @product.unhighlight
          flash[:notice] = t("highlight_products.product_has_been_unhighlighted")
          redirect_to admin_products_url
        end
      end
    end
  end
end

