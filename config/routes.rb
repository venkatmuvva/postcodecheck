Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match 'validate' => 'postcodes#validate', as: :postcode_validation, via: :get

  root to: 'postcodes#index', as: :postcode_validation_home, via: :get

end
