Rails.application.routes.draw do
  root "homes#top"
  get "/about" => "homes#about"
  
  #deviseのcontrollerを二つ作ったため、それぞれのルーティングが必要
  devise_for :admins, controllers: {
        sessions: 'admin/devise/sessions'
      }
  devise_for :customers, controllers: {
        sessions: 'public/devise/sessions'
      }

#namespaceを用いてpublicとadminのルーティングを指定
    namespace :public do
    	resources :questions
    	resources :choices
      resources :customers
    end 


    namespace :admin do
    	resources :questions
    	resources :choices
      resources :customers
    end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
