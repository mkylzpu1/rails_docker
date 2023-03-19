Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # ファイル変換
  get 'words/index', as: :words
  post 'words/upload', as: :word_upload
  get 'words/complete', as: :word_complete
  
  # root "articles#index"
    # rootをログイン画面に設定
    devise_for :users, controllers: {
      # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords",
      confirmations: "users/confirmations"
    }
    devise_scope :user do
      root to: 'users/registrations#new'
      resources :dashboard, :books, :book_times
      post '/test', to: 'books#test', as: :test
      get 'users/passwords/reset_confirm', to: 'users/passwords#reset_confirm', as: :reset_confirm
    end



end
