Rails.application.routes.draw do
  post 'logs', to: 'logs#index'
end
