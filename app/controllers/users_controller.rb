class UsersController < ApplicationController
def show
  @user = User.find(params['id'])
  @id = params['id']
end
end