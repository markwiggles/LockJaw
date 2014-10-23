login = "<p class='logged-in-as'>Logged in as <%= spree_current_user.login %></p>"


Deface::Override.new({:virtual_path => 'spree/shared/_nav_bar',

                      :name => 'add_loggedin',
                      :insert_before => '#nav-bar',
                      :text => "<% if spree_current_user %>" "#{login}<% end %>"

                     })