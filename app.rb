require 'sinatra'
require 'pg'

db_params = {
	host: ENV['host'],
	port: ENV['port'],
	dbname: ENV['db_name'],
	user: ENV['user'],
	password: ENV['password']
}
db = PG::Connection.new(db_params)
get '/' do
	phonebook = db.exec("SELECT first_name, last_name, street_address, city, state, zip, cell_phone, home_phone, work_phone FROM phonebook");
	erb :index, :locals => {:phonebook => phonebook}
end
post "/phonebook" do
first_name = params[:first_name]
last_name = params[:last_name]
street_address = params[:street_address]
city = params[:city]
zip = params[:zip]
cell_phone = params[:cell_phone]
home_phone = params[:home_phone]
work_phone = params[:work_phone]
end
