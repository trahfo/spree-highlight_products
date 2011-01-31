module HighlightProducts
  module ProductModelExt
    def self.included(base)
      base.class_eval do
        scope :highlighted, :where => "products.highlighted_at IS NOT NULL", :order => "highlighted_at DESC"

        def highlight
          self.update_attribute(:highlighted_at, Time.current)
        end

        def unhighlight
          self.update_attribute(:highlighted_at, nil)
        end

        private

        def self.best_sellers(n, start = 1.week.ago, finish = Time.now)
          # most ordered items
          # looks for completed orders from date range (default: the past week)
          # then gets top N sellers by quantity
          # query: need to filter out cancelled orders?
          #
          # Jul09: had problem with :select vs :include in checkout_complete, hence the DIY
          best_n = Order.between(start,finish).find(:all,
                             :joins => "INNER JOIN checkouts ON orders.id = checkouts.order_id AND checkouts.state = 'complete'" +
                                       " INNER JOIN line_items ON orders.id = line_items.order_id" +
                                       " INNER JOIN variants ON variant_id = variants.id",
                             :select => "product_id, SUM(quantity) sum",
                             :group => "product_id ORDER BY sum DESC",
                             :limit => n)
            best_n.map {|o| [o.sum, Product.find(o.product_id)] }
        end
      end
    end
  end
end

