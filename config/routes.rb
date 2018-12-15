Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :companies
      resources :products
      resources :shipments
      resources :shipment_products
    end
  end
  
end
