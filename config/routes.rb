Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'students#index'})
  match('/students', {:via => :post, :to => 'students#create'})
  match('/:name', {:via => :get, :to => 'students#show'})
end
