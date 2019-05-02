class GossipsController < ApplicationController
def new
  @gossip = Gossip.new
end

def create
  @gossip = Gossip.new(
    title: params[:title], 
    content: params[:content], 
    user: User.all.sample)

  if @gossip.save
    redirect_to '/'
  else
    render 'new'
  end
end 

def show
  @gossip = Gossip.find(params['id'])
  @id = params['id']
end

def edit
  @gossip = Gossip.find(params[:id])
  @id = params['id']
end

def update
  @gossip = Gossip.find(params[:id])
  if @gossip.update(
    title: params[:title], 
    content: params[:content], 
    user: User.all.sample)
    redirect_to '/'
  else
    render :edit
  end
end

def destroy
  @gossip = Gossip.find(params['id'])
  @gossip.destroy
  redirect_to '/'
end

end
