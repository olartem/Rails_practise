class SecretController < ApplicationController
  def index 
		if user_signed_in?
			render 'index'
		else
			redirect_to home_index_path
		end
  end
end
