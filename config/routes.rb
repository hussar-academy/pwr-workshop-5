Rails.application.routes.draw do
  namespace :api do
    resources :digs do
      member do
        post 'vote'
        get 'comments'
        get 'comments/:comment_id', to: 'digs#comment'
      end
    end
  end

  get 'api' => proc { [404, {}, ['Invalid API endpoint']] }
  get 'api/*path' => proc { [404, {}, ['Invalid API endpoint']] }

  root 'home#index'

  get '*path', to: 'home#index'
end

