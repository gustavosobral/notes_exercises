## FRAGMENT CACHING

# app/views/comments/_comment.html.erb
<% cache ['v1', comment] do %>
  <li><%= comment %></li>
<% end %>
