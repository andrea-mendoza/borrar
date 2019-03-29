Rails.application.routes.draw do
  
  root 'events#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :events do
    resources :surveys, except: [:edit, :update]
    resources :papers do
      resources :comments
      resources :reviews
      resources :assingments
      resources :classrooms
    end
  end

  resources :users, except: [:create, :show]

  post 'create_user' => 'users#create', as: :create_user
  get '/documents' => 'papers#list_all'
  get '/my_documents' => 'papers#my_documents'
  get '/assigned_tutor' => 'papers#list_assigned_tutor'
  get '/assigned_relator' => 'papers#list_assigned_relator'
  get '/users/change_password' => 'users#change_password'
  post '/users/update_password' => 'users#update_password'
  get '/events/:event_id/papers/:id/edit_status' => 'papers#edit_status'
  patch '/events/:event_id/papers/:id' => 'papers#update_status'   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
