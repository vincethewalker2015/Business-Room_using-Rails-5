class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    
    # GET to /users/:user_id/profile/new
  def new
    @profile = Profile.new
  end
  
  def create
  # Ensure that we have the user who is filling out form
  @user = User.find( params[:user_id] )
  # Create profile linked to this specific user
  @profile = @user.build_profile( profile_params )
  if @profile.save
    flash[:success] = "Profile updated!"
    redirect_to root_path
  else
    render action: :new
  end
  end
  
  def edit
     @user = User.find( params[:user_id] )
     @profile = @user.profile
  end
  
  def update
   @user = User.find( params[:user_id] )
   @profile = @user.profile
   if @profile.update_attributes(profile_params)
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
   else
     render action: :edit
   end
 end
  
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description, :picture)
    end
    
    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_url) unless @user == current_user
    end
    
end