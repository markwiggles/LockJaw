Deface::Override.new({:virtual_path => 'spree/shared/_head',

                      :name => 'change_favicon',
                      :replace => "erb[loud]:contains('favicon_link_tag')",
                      :text => "<%= favicon_link_tag 'assets/favicon.ico' %>"
                     })
