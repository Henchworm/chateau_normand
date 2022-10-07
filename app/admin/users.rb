# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :phone_number, :code


  action_item only: :show do
    link_to 'Authorize', "http://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_CLIENT']}&response_type=code&redirect_uri=http://localhost:3000/admin/users/&approval_prompt=auto&scope=activity:read_all"
  end


  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :phone_number
    end
    f.actions
  end
end
