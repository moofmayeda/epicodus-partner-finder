Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'students#index'})
  match('/lessons', {:via => :get, :to => 'lessons#index'})
  match('/lessons', {:via => :post, :to => 'lessons#create'})
  match('/students', {:via => :post, :to => 'students#create'})
  match('/students/:id', {:via => [:patch, :put], :to => 'students#update'})
  match('/students/:id', {:via => :delete, :to => 'students#destroy'})
  match('/lessons/:id', {:via => :get, :to => 'lessons#show'})
  match('/lessons/:id', {:via => [:patch, :put], :to => 'lessons#update'})
  match('/lessons/:id', {:via => :delete, :to => 'lessons#destroy'})
  match('/:name', {:via => :get, :to => 'students#show'})
end
