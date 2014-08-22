Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'students#index'})
end
