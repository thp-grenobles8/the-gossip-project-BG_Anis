class UsersController < ApplicationController
def new
end

def create
  @user = User.new(
                  email: params[:email],
                  password: params[:password],
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  description: Faker::Lorem.words(30).join(" ").capitalize,
                  age: rand(20..40),
                  city: City.all.sample
                  )

  if @user.save
    redirect_to '/'
  else
    render 'new'
  end
end

def show
  @user = User.find(params['id'])
  @id = params['id']
end
end