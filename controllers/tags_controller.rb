require ("sinatra")
require ("sinatra/contrib/all")
require_relative ( "../models/tags.rb")
also_reload ( "../models/*" )

# lists
get tags do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

# # creates new tag
# get '/tags/new' do
#   @merchants = Merchant.all
#   erb(:new)
# end
#
# # this logs the above tag in database
# post '/tags' do
#   Tag.new(params).save
#   redirect to '/tags'
# end
