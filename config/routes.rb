Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/passengers', to: 'passengers#index'

  get '/flights', to: 'flights#index'

  delete '/flights/:flight_id/passengers/:passenger_id', to: 'flight_passengers#destroy'

  get '/airlines/:id', to: 'airlines#show'

end
