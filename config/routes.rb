Rails.application.routes.draw do
  root 'home#index'
  get 'analytics/index', as: 'analytics'
  post 'analytics' => 'analytics#selected_date'
  get 'home/index'

  # Add future routes here
  get 'auth/signin'
  get 'auth/signout'

  # Add route for OmniAuth callback
  match '/auth/:provider/callback', to: 'auth#callback', via: [:get, :post]
end
