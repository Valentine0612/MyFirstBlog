Rails.application.routes.draw do
  devise_for :users
  resources :exercises do
    resources :comments
    post 'change_rating'
  end
  get 'save_exercise', to: 'users#save_exercise', as: 'user_save_exercise'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:id/exercises', to: 'users#exercises'
  get 'user_saves', to: 'users#saves', as: 'user_saves'
  get 'feed', to: 'exercises#feed'
  get 'saves', to: 'exercises#saves', as: 'saves'
  root 'exercises#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
