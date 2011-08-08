module HighlightProducts
  module ProductModelExt
    def self.included(base)
      base.class_eval do
        scope :highlighted, where("products.highlighted_at IS NOT NULL").order("highlighted_at DESC")

        def highlight
          self.update_attribute(:highlighted_at, Time.current)
        end

        def unhighlight
          self.update_attribute(:highlighted_at, nil)
        end

        def self.best_sellers(n, start = 1.week.ago, finish = Time.now)
          # most ordered items
          # looks for completed orders from date range (default: the past week)
          # then gets top N sellers by quantity
          # query: need to filter out cancelled orders?
          #
          # Jul09: had problem with :select vs :include in checkout_complete, hence the DIY
          # Aug11: replaced sql joins with fancy associations
          best_n = Order.between(start,finish).find(:all,
                             :joins => [{:line_items => :product}],
                             :select => "product_id, SUM(quantity) sum",
                             :conditions => "completed_at IS NOT NULL AND products.deleted_at IS NULL",
                             :group => "product_id ORDER BY sum DESC",
                             :limit => n)
          best_n.map {|o| [o.sum, Product.find(o.product_id)] }
        end
      end
    end
  end
end