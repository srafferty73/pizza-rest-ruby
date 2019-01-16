require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')

get '/' do
  erb( :home)
end

# INDEX

get '/pizza-orders' do
  # Go to the database and retrieve all the orders
  @orders = PizzaOrder.all
  # Display a list of all the orders
  erb( :index )
end

# NEW

get '/pizza-order/new' do
  erb( :new )
end

# CREATE

post '/pizza-orders' do
  # Create a new PizzaOrder object
  PizzaOrder.new( params ).save
  # Save it to the db
  # Redirect browser to '/pizza-orders'
  redirect to '/pizza-orders'
end

# SHOW

get '/pizza-orders/:id' do
    # Retrieve one pizza order from db
    @pizza_order = PizzaOrder.find(params[:id])
    # Display the details of that order
    erb( :show)
end

# EDIT

get '/pizza-orders/:id/edit' do
  # Retrieve required order from db
  @pizza_order = PizzaOrder.find(params[:id])
  # Display the details of that order to edit
  erb( :edit)
end

# UPDATE

put '/pizza-orders/:id' do
  # Select
  PizzaOrder.new ( params ).update
  redirect to '/pizza-orders'
end

# DESTROY

delete '/pizza-orders/:id' do
  # Select order to be deleted
  @pizza_order = PizzaOrder.find(params[:id]).delete
  # Delete the order
  redirect to '/pizza-orders'
end
