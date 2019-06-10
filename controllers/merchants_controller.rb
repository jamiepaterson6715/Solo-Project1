require ("sinatra")
require ("sinatra/contrib/all")
require_relative ( "../models/merchants.rb")
also_reload ( "../models/*" )

# get tags do
#   @merchants = Merchants.all()
#   erb ( :"merchants/index" )
# end
#
# get '/merchants/:id' do
#   @merchants = Merchant.find(params['id'].to_i)
#   erb( :"merchants/show" )
# end

































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
