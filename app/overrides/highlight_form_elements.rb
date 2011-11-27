Deface::Override.new(
  :virtual_path => "admin/products/_form",
  :name => "highlight_form_elements",
  :insert_bottom => "[data-hook='admin_product_form_right']",
  :partial => "admin/products/highlight_form_elements",
  :disabled => false)