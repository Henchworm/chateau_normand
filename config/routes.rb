# frozen_string_literal: true

Rails.application.routes.draw do
  get 'twilio/sms'
  devise_for :users, ActiveAdmin::Devise.config
  root to: 'admin/dashboard#index'
  ActiveAdmin.routes(self)
  # post ‘/twilio/sms’

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
