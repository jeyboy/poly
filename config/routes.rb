Rails.application.routes.draw do
  mount Poly::Engine => '/poly', as: 'poly'
end