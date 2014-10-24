# Remove existing Home link
Deface::Override.new({:virtual_path => 'spree/shared/_main_nav_bar',
                      :name => 'remove_home_link',
                      :replace => '#home-link',
                      :text => ''
                     })