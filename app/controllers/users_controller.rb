class UsersController < ApplicationController
  expose(:user)
  expose(:users)
  expose(:notes, ancestor: :user)
  expose(:user_form){ NewUserForm.new(user_params, user: user) }
  expose(:search_form){ SearchForm.new(search_params) }

  def index
    self.users = SearchService.new(search_form).search!
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      if user_form.save
        format.html { redirect_to user_form.user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: user_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if user_form.save
        format.html { redirect_to user_path(user_form.user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: user }
      else
        format.html { render :edit }
        format.json { render json: user_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    return {} unless params[:user].present?
    params.require(:user).permit(:correo, :type)
  end

  def search_params
    return {} unless params[:search].present?
    params.require(:search)
  end
end
