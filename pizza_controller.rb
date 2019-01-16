require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require( 'pry' )
also_reload('./models/*')
