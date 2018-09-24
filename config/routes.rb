Rails.application.routes.draw do
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/tasks/all', to: 'tasks#destroy_all', as: 'destroy_all_tasks'

  resources :tasks

  patch '/tasks/:id/update_date', to: 'tasks#update_date', as: 'update_task_date'
end
