class UsersController < ApplicationController
  layout "base_layout", only: [ :sign_in, :sign_up]
  before_action :set_user, only: %i[ show update destroy ]

  def profile
    @user = User.find(session[:user_id])
    @rentals = Rental.where(user_id: session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def sign_in
    @user = User.new
  end

  def login
    #test code
    if !session[:user_id]
      session[:user_id] = User.first.id
    end

    redirect_to home_path
  end
  def sign_up
    @user = User.new
  end

  def register
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id

        format.html { redirect_to home_path, notice: "User was successfully created." }
      else
        format.html { render :sign_up, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def logout
    session[:user_id] = nil

    redirect_to action: :sign_in
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to sign_up, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :birth_date)
    end
end
