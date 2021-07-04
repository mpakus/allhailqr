Rails.application.routes.draw do
  scope '(:locale)', locale: /ru|en/ do
    resources :messages, only: %i[new create show]
  end

  root to: 'messages#new'
end
