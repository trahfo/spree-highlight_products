Deface::Override.new(
  :name => 'highlight_row_actions',
  :virtual_path => "admin/products/index",
  :insert_bottom => "[data-hook='admin_products_index_row_actions']",
  :partial => "admin/products/highlight_product_button",
  :disabled => false)