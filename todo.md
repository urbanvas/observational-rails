I went ahead and looked through your code and there is a lot of great functionality! One place that you will need to refactor though is creating a many-to-many relationship through a join table with a user submittable attribute. Instead of separately connecting each model to User, you could try using System as your join table and connecting Users to Galaxies through systems. I would also refactor your scope method (or add in another one) that returns an ActiveRecord relation using Active Record Query/Scope methods like the ones detailed here: https://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html

YOU HAVE TO CONNECT PLANETS TO OBSERVATIONS
BUT ALSO TO SYSTEMS
#create planets on ob new/create edit/update/
(on index/show it will link to edit path to create planets/systems)
(destroy should destroy all planets and systems created for observation)

<%= collection_select(:observation, :user_id, User.all, :id, :username, {}, {multiple: false}) %>

everything except seeing all users
index/show you'll just redriect them to the edit page
in systems/planets you'll show them individual and all as a whole collective outside from observations
in observations new/create you'll be able to add planets and systems one time
in observations edit/update you'll be able to edit names and delete planets/systems one time
in observations destroy you should delete planets/systems one time
