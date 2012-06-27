Deface::Override.new(
  :name => 'highlight_index_search',
  :virtual_path => "spree/admin/products/index",
  :insert_bottom => "[data-hook='admin_products_index_search']",
  :partial => "spree/admin/products/highlight_search_elements",
  :disabled => false)