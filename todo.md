USER SHOW PAGE ONLY SHOWS UNIQ GALAXIES, if want to change 'users/show' and drop the .uniq method

<%= collection_select(:observation, :galaxy_id, Galaxy.all, :id, :name, {}, {multiple: false}) %>

add more urls
Add styling 

USE Two way has many thru

rails db:drop && rails db:migrate && rails db:seed

u = User.first
o = Observation.first
p = Planet.first
s = System.first
g = Galaxy.first



<h1>Planets</h1>
<% @observation.planets.each do |planet| %>
<p>Planet: <%= link_to planet.name, observation_planet_path(@observation, planet) %></p>
<br>
<% end %>
<br>

<h1>Galaxies</h1>
<% @observation.galaxies.each do |galaxy| %>
<p>Galaxy: <%= link_to galaxy.name, observation_galaxy_path(@observation, galaxy) %></p>
<br>
<% end %>
<br>
<% if session[:user_id] == @observation.user_id %>
<% end %>
<br>
<% if session[:user_id] == @observation.user_id %>
<%= link_to "Add System", new_observation_system_path(@observation) %> |
<%= link_to "Add Planet", new_observation_planet_path(@observation) %> |
<%= link_to "Add Galaxy", new_observation_galaxy_path(@observation) %> |
<%= link_to "Edit Observation", edit_observation_path %> |
<%= link_to "Destroy", @observation, method: :delete, data: {confirm: "Sure?"} %>
<% end %>
<br>
<%= link_to "Back to User Home", user_path(session[:user_id]) %>


<%= link_to "Back to Observation", @system.observation %>


<h1>System</h1>
<% if @observation.system %>
<p>Link to System: <%= link_to @observation.system.name, observation_system_path(@observation, @observation.system) %></p>
<% end %>


find out if you need the hidden field in the observation id in the galaxies form 

<%= f.collection_select :id, Galaxy.all, :id, :name, {include_blank: true} %>




<%= f.label :name %>
<%= f.text_field :name %>

<%= f.label :life %>
<%= f.check_box :life %>

<%= f.label :classification%>
<%= f.select :classification, ['Elliptical', 'Spiral', 'Irregular'] %>

<%= f.label :color %>
<%= f.text_field :color %>

<datalist id="categories_autocomplete">
  <% Galaxy.all.each do |category| %>
    <option value="<%= category.name %>">
  <% end %>
</datalist>

<%= hidden_field(:galaxy, :observation_id, :value => params[:observation_id]) %>


<br>

<%= f.submit %>