require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./controllers/account')
require('./models/item')
require('./models/account')

map('/') { run ItemsController }
map('/account') { run AccountsController }
