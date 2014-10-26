

# text = "<nav class='navbar col-md-8' id='top-nav-bar'>
#   <ul id='nav-bar' class='nav navbar-nav navbar-right' data-hook>
#     <li id='search-bar' data-hook>
#       <%= render :partial => 'spree/shared/search' %>
#     </li>
#   </ul>
# </nav>"
#
#
#
# Deface::Override.new({:virtual_path => 'spree/shared/_nav_bar',
#                       :name => 'remove_class',
#                       :replace => '#top-nav-bar',
#                       :text => text
#                      })