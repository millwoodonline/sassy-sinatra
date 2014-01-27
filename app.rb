require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'


class App < Sinatra::Base
  register Sinatra::AssetPack
	assets do
    css :main, [
     '/css/reset.css',
     '/css/*.css'
    ]
    css_compression :sass
  end

  get '/?' do
    erb :index
  end
end

if __FILE__ == $0
  App.run!
end