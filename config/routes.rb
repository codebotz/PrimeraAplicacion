Rails.application.routes.draw do
  #get 'pages/home'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Configuración de páginas
  get 'about' => 'pages#about'

end
