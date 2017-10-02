Rails.application.routes.draw do

  scope path: "api" do
    resources :movies
  end

end
