

jquery_cdn = "<%= javascript_include_tag 'https://code.jquery.com/jquery-1.11.1.min.js' %>"

Deface::Override.new({:virtual_path => 'spree/shared/_head',

                      :name => 'add_jquery_cdn',
                      :insert_before => "erb[loud]:contains('stylesheet_link_tag')",
                      :text => "#{jquery_cdn}"

                     })

Deface::Override.new({:virtual_path => 'spree/admin/shared/_head',

                      :name => 'add_jquery_cdn_to_admin',
                      :insert_before => "erb[loud]:contains('stylesheet_link_tag')",
                      :text => "#{jquery_cdn}"
                     })


