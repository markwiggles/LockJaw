Deface::Override.new({:virtual_path => 'spree/shared/_nav_bar',
                      :name => 'remove_class',
                      :remove_from_attributes => '#top-nav-bar',
                      :attributes => {:class => 'col-md-8'}
                     })