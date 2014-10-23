
include Spree::Core::ControllerHelpers

admin_link = '<li id="admin-link" data-hook><%= link_to "CMS", "/admin" %></li>'


Deface::Override.new({:virtual_path => 'spree/shared/_main_nav_bar',

                      :name => 'remove_home_link',
                      :replace => '#home-link',
                      :text => "<li id='home-link' data-hook><%= link_to 'HOME', '/home' %></li>
  #{admin_link}"
                     })