
# if params[:power]
#   @heroines = Heroine.where('power LIKE ?', "%#{params[:power]}%")
# else



 <%= form_tag(heroines_path method: :get) do %>
 Search by Powers: <%= text_field_tag :power, params[power] %>
 <%= submit_tag 'Search' %>
 <% end %>
