require ("sinatra")
require ("sinatra/contrib/all")
require_relative ( "../models/tag.rb")
also_reload ( "../models/*" )

# lists
get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

# creates new tag
get '/tags/new' do
  @tags = Tag.all
  erb(:"tags/new")
end

post '/tags' do
  @tags = Tag.new(params)
  @tags.save
redirect to '/tags'
end

# deletes a tag
post '/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete
  redirect to '/tags'
end

# # edits a specific tag
# post '/tags/:id/edit' do
#   @tags = Tag.all
#   erb(:edit)
# end
#
# # edits existing  tag in database - relates to above
# post '/tags/:id' do
#   tags = Tag.new(params)
#   Tag.update
#   redirect to "/tags/#{params['id']}"
# end
