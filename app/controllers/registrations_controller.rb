class RegistrationsController < Devise::RegistrationsController

	def edit
	end

	def update
	    @user = User.find(current_user.id)
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to root_url }
	        format.json { render :show, status: :ok, location: @user }
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

  	protected
	  def update_resource(resource, params)
	    resource.update_without_password(params)
	  end

  	private
	    def sign_up_params
	      params.require(:user).permit(:email, :password, :password_confirmation, :address)
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def user_params
	      params.require(:user).permit(:email, :password, :password_confirmation, :address)
	    end
end