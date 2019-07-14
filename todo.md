I went ahead and looked through your code and there is a lot of great functionality! One place that you will need to refactor though is creating a many-to-many relationship through a join table with a user submittable attribute. Instead of separately connecting each model to User, you could try using System as your join table and connecting Users to Galaxies through systems. I would also refactor your scope method (or add in another one) that returns an ActiveRecord relation using Active Record Query/Scope methods like the ones detailed here: https://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html

# require login

# have show edit update destory only availble to logged in users under users
