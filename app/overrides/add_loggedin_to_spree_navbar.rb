login = "<p class='logged-in-as'>Logged in as <%= spree_current_user.login %></p>"


Deface::Override.new({:virtual_path => 'spree/shared/_header',

                      :name => 'add_loggedin',
                      :insert_after => '#spree-header',
                      :text => "<% if spree_current_user %>" "#{login}<% end %>"

                     })