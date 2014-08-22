Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'students#index'})
  match('/students', {:via => :post, :to => 'students#create'})
end
