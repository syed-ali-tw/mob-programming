Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root "home#index"
  get "/blogs" => "blogs#index"
  get "/blogs/new" => "blogs#new"
  post "/blogs/create" => "blogs#create"
  get "/blogs/:id/edit" => "blogs#edit", as:"edit_path"
end
