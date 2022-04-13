Rails.application.routes.draw do
  namespace :v1 do
   resources :signs, only: %i[index create destroy]
  end
end
