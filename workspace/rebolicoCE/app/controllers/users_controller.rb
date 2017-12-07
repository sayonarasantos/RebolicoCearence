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
    # @userr = User.find(params[:id])
    @user = User.find(params[:id])
    @events = @user.events
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
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       session[:user_id] = @user.id 
  #       format.html { redirect_to @users , notice: 'User was successfully created.' }
  #       #format.json { render :show, status: :created, location: @user }
  #     else
  #     redirect_to '/signup'
  #     end
  #   end
  # end
  
  
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/signup'
    end
  end 
  
  
  
  
#   	def create 
# 	  @user = User.new(user_params) 
# 	  if @user.save 
# 	    session[:user_id] = @user.id 
# 	    redirect_to '/' 
# 	  else 
# 	    redirect_to '/signup' 
# 	  end 
# 	end 
  
  
  
  
  
  

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Cadastro atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Cadastro removido com sucesso!' }
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
      params.require(:user).permit(:name, :cpf, :birthdate, :email,  :password, :password_confirmation)
      # params.require(:user).permit(:name, :cpf, :birthdate, :email, :password_digest)
    end
end
