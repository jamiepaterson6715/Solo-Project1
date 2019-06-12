require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("./models/*")
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')

get '/' do
    @transactions = Transaction.all()
erb( :index )
end
