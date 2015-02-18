Bloccit::Application.routes.draw do
  devise_for :users
  resources :posts, :questions
  get 'about' => 'welcome#about'

root to: 'welcome#index'



end