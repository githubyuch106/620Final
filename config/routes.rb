Rails.application.routes.draw do
  
  root 'member#login'

  get 'admin/dashboard'
  post 'admin/create'

  get 'book/index'

  get 'book/show'

  get 'book/edit'

  get 'book/update'

  get 'book/delete'

  get 'member/login'
  get 'member/register'
  get 'member/logout'

  post 'member/register_post'
  post 'member/login_post'

  get 'book/checkout'
  post 'book/checkout_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
