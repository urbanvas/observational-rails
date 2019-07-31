<%= collection_select(:observation, :user_id, User.all, :id, :username, {}, {multiple: false}) %>

add more urls
Add styling 

USE Two way has many thru

rails db:drop && rails db:migrate && rails db:seed

u = User.first
o = Observation.first
p = Planet.first