# Add new links and navbar

home_link = "<li id='home-website-link' data-hook><%= link_to 'HOME', '/home' %></li>"
cms_link = "<li id='admin-link' data-hook><%= link_to 'CMS', '/admin' %></li>"
admin_link = "<li id='admin-link' data-hook><%= link_to 'Spree Admin', '/shop/admin' %></li>"


Deface::Override.new({:virtual_path => 'spree/shared/_header',

                      :name => 'add_links',
                      :insert_after => "erb[loud]:contains('spree/shared/nav_bar')",
                      :text => "

  <div class='navbar navbar-inverse navbar-fixed-top' id='spree-shop'>

  <div class='container'>

    <a class='navbar-brand' href='#'>
      <img alt='ladderclampz' class='img-responsive' height='100' id='logo2' src='/assets/ladderclampz_logo.png' width='200'>
    </a>

    <button type='button' class='navbar-toggle' data-toggle='collapse' data-target='.navbar-collapse'>
      <span class='icon-bar'></span>
      <span class='icon-bar'></span>
      <span class='icon-bar'></span>
    </button>

    <div class='navbar-collapse collapse in'>
      <ul class='nav navbar-nav' id='spree-shop-nav' data-hook>#{home_link}
      <% if spree_current_user
      if spree_current_user.has_spree_role?('admin')  %>" "#{cms_link} #{admin_link}
    <% end %>
    <% end %>
    </ul>
    </div>
    </div>
"

                     })





