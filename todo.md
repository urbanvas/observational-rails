I went ahead and looked through your code and there is a lot of great functionality! One place that you will need to refactor though is creating a many-to-many relationship through a join table with a user submittable attribute. Instead of separately connecting each model to User, you could try using System as your join table and connecting Users to Galaxies through systems. I would also refactor your scope method (or add in another one) that returns an ActiveRecord relation using Active Record Query/Scope methods like the ones detailed here: https://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html

# require login

# have show edit update destory only availble to logged in users under users

# user can be found by session so it doesnt need to be a nested resource

#create planets on ob new/create edit/update/
(on index/show it will link to edit path to create planets/systems)
(destroy should destroy all planets and systems created for observation)

# implment sessions and security before moving on so you can carrys session hash all over with you so you dont have to keep users/id in params

# perhaps have only users new/create

just to save time

<%= collection_select(:observation, :user_id, User.all, :id, :username, {}, {multiple: false}) %>
