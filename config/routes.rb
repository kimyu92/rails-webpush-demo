# frozen_string_literal: true

Rails.application.routes.draw do
  get "/" => "content#index"

  resources :content, path: '' do
    collection do
      post :sendkeys
      post :send_push
    end
    # post "/sendkeys" => "content#getJSON", :as => :getJSON
    # post "/sendNo" => "content#sendPush", :as => :sendPush
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
