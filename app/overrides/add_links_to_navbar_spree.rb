


# Add new links and navbar

home_link = "<li id='home-website-link' data-hook><%= link_to 'HOME', '/home' %></li>"
cms_link = "<li id='admin-link' data-hook><%= link_to 'CMS', '/admin' %></li>"
admin_link = "<li id='admin-link' data-hook><%= link_to 'Spree Admin', '/shop/admin' %></li>"


Deface::Override.new({:virtual_path => 'spree/shared/_header',

                      :name => 'add_links',
                      :insert_after => "erb[loud]:contains('spree/shared/nav_bar')",
                      :text => "<div id='shop-nav-bar' class='navbar-collapse collapse'>
<ul class='nav navbar-nav' data-hook>#{home_link}
<% if spree_current_user
if spree_current_user.has_spree_role?('admin')  %>" "#{cms_link} #{admin_link}<% end %><% end %></ul></div>"

                     })




