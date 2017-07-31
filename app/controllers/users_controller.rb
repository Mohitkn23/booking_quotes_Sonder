class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.unit_id = Unit.first #Hard-Code kiya hai
    if @user.save
      flash[:notice] = "Article was successfully created."
      redirect_to user_path(@user) #Redirected to show.html.erb
    else
      render 'new' #It will show the new.html.erb with all the params present and display all the errors because of which it wasn't able to save.
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #@user.unit_id = Unit.first #Hard-Code kiya hai
    if @user.update(user_params)
      flash[:notice] = "Article was successfully created."
      redirect_to user_path(@user) #Redirected to show.html.erb
    else
      render 'edit' #It will show the new.html.erb with all the params present and display all the errors because of which it wasn't able to save.
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :checkin, :checkout)
    end
end
