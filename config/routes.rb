Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'students#index'})
  match('/students', {:via => :post, :to => 'students#create'})
  match('/students/:id', {:via => [:patch, :put], :to => 'students#update'})
  match('/students/:id', {:via => :delete, :to => 'students#destroy'})
  match('/:name', {:via => :get, :to => 'students#show'})
end
