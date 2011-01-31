# Highlight Products

This is an extension for [Spree][1], put together by [jomz][2] and upgraded for Rails 3 by [joshmcarthur][5]

This extension makes it possible to 'highlight' certain products that you can then easily show on the homepage for example. Highlighting a product updates a newly added timestamp on the Product model. There is also a named scope Product.highlighted, which selects all products that have been highlighted, and orders them so that the first in the result is the last one highlighted. There is no 'unhighlight' button.

I started off with [paulcc's promotions extension][3], but the only thing left of it is the best\_sellers method, which I moved to the Product model..
There is an [other extension also called promotions][4], which better deserves the name, as it's about actual promotions (lowered prices), and not about promoting something to the home page.

## Installation
* Add extension to your Gemfile `gem 'highlight_products', :git => 'https://github.com/joshmcarthur/spree-highlight-products.git', :branch => 'rails3'`
* Run `bundle install`
* Copy migrations and assets to your application by running `rake highlight_products:install`
* Run `rake db:migrate` to update your schema, and reboot the server.

Copy to your project's vendor/extensions dir, and make sure the naming is right (remove the 'spree-' prefix).
Run rake db:migrate.
Reboot the server.

[1]: http://spreecommerce.com/ "Spree: Open Source E-Commerce for Ruby on Rails"
[2]: http://hardcoreforkingaction.com "Hard-core forking action: a low frequency, web-tech blog by Benny Degezelle"
[3]: http://github.com/paulcc/spree-promotions/network "Promotions extension by Paul Callaghan"
[4]: http://ext.spreecommerce.com/extensions/46-promotions "Promotions extension by Marcin Raczkowski"
[5]: http://www.github.com/joshmcarthur

## Usage

Highlight products from the admin/products index page. Then you can use <code>Product.highlighted(:limit => 3)</code> anywhere to get the last 3 highlighted products.

