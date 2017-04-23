Rails.application.routes.draw do
  resources :posts
  devise_for :users
  #get 'pages/home'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Configuración de páginas
  get 'about' => 'pages#about'

  get 'archivoprueba' => 'prueba#archivoprueba'
  get 'rails' => 'prueba#rails'

end
