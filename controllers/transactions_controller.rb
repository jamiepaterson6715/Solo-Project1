require ("sinatra")
require ("sinatra/contrib/all")
require_relative ( "../models/tag.rb")
require_relative ( "../models/transaction.rb")
also_reload ( "../models/*" )

# lists
get '/transactions' do
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

get 'transactions/:id' do
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

# creates new tag/ updated for new.erb
get '/transactions/new' do
  @merchant =Merchant.all
  @tags = Tag.all
  @transactions = Transaction.all
  erb(:"transactions/new")
end

post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save
redirect to '/transactions'
end

# deletes a tag
post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/transactions'
end

# edits a specific tag
get '/transactions/:id/edit' do
  @transactions = Transaction.find(params['id'])
  erb(:"transactions/edit")

  # @tags = Tag.all
  # erb(:"tags/edit")
end

# edits existing  tag in database - relates to above
post '/tags/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
  # after creation of show page this will work - hopefully
end
