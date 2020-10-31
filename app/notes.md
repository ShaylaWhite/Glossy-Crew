create
create!
save
save!
update
update!

Trigger validations


omni 

clicks login
redirected to third party 
url callback
user authorized 
token is generated

css.scss
provide a key pair for the app to identfiy
“/auth/:provider/callback”. :provider

has_secure

user = User.new(name: 'david', password: '', password_confirmation: 'nomatch')
user.save                                                       # => false, password required
user.password = 'mUc3m00RsqyRe'
user.save                                                       # => false, confirmation doesn't match
user.password_confirmation = 'mUc3m00RsqyRe'
user.save                                                       # => true
user.authenticate('notright')                                   # => false
user.authenticate('mUc3m00RsqyRe')                              # => user
User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user


GET is used to request data from a specified resource.
POST is used to send data to a server to create/update a resource.


Helpers Vs Models


Helpers should only contain logic for the view

Models should contain only logic related to the object modeled, never related with the transaction performed neither the view rendered

Partials 

easy resue of the same componet
ireate over a collection

Scope vs Class

Scope allows you to be more specifc and exact
scope is a collection

METHOD Scope

gives you access the the method outside of the local varibale bewtween the def and end 

you get nil class whne your instance varaible is not populated



