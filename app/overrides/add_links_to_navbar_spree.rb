


Deface::Override.new({:virtual_path => 'spree/shared/_main_nav_bar',

                      :name => 'remove_home_link',
                      :replace => '#home-link',
                      :text => "<li id='home-link' data-hook><%= link_to 'HOME', '/home' %></li>"

})

cms_link = '<li id="admin-link" data-hook><%= link_to "CMS", "/admin" %></li>'
admin_link = '<li id="admin-link" data-hook><%= link_to "Spree Admin", "/shop/admin" %></li>'


Deface::Override.new({:virtual_path => 'spree/shared/_main_nav_bar',

                      :name => 'add_admin_link',
                      :insert_after => '#home-link',
                      :text => "<% if spree_current_user
if spree_current_user.has_spree_role?('admin')  %>" "#{cms_link} #{admin_link}<% end %><% end %>"

                     })