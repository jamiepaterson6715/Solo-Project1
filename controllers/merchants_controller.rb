require ("sinatra")
require ("sinatra/contrib/all")
require_relative ( "../models/merchant.rb")
also_reload ( "../models/*" )


# lists
get '/merchants' do
  @merchants = Merchant.all()
  erb ( :"merchants/index" )
end


# creates new tag
get '/merchants/new' do
  @merchants = Merchant.all
  erb(:"merchants/new")
end

get '/merchants/:id' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end


post '/merchants' do
  @merchants = Merchant.new(params)
  @merchants.save
redirect to '/merchants'
end

# deletes a tag
post '/merchants/:id/delete' do
  tag = Merchant.find(params['id'])
  tag.delete
  redirect to '/merchants'
end

# edits a specific tag
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'])
  erb(:"merchants/edit")

  # @tags = Tag.all
  # erb(:"tags/edit")
end

# edits existing  tag in database - relates to above
post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "/merchants/#{params['id']}"
  # after creation of show page this will work - hopefully
end

































# # list
# get '/students' do
#   @students = Student.all
#   erb(:index)
# end
# # creates new student
# get '/students/new' do
#   @houses = House.all
#   erb(:new)
#   # erbs files need corresponding view files
# end
#
# # this logs the above student in database
# post '/students' do
#   Student.new(params).save
#   redirect to '/students'
# end
#
# # Views a specific student
# get '/students/:id' do
#   @student = Student.find(params['id'])
#   erb(:show)
# end
#
# # edits a specific student
# get '/students/:id/edit' do
#   @houses = House.all
#   @student = Student.find(params['id'])
#   erb(:edit)
# end
#
# # edits existing  student in database - relates to above
# post '/students/:id' do
#   student = Student.new(params)
#   student.update
#   redirect to "/students/#{params['id']}"
# end
#
# # deletes a student
# post '/students/:id/delete' do
#   student = Student.find(params['id'])
#   student.delete
#   redirect to '/students'
# end
