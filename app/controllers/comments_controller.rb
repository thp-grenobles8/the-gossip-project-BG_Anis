class CommentsController < ApplicationController
def new
@comment = Comment.new
end

def create
@comment = Comment.new(
  content: params[:content],
  user: User.all.sample
  )

  if @comment.save
    redirect_to :root
    flash [:succes] = "Com ajouté !" 
  else
    flash [:danger] = "Erreur"
  end
end 

def edit
  @comment = Comment.find(params['id'])
  @id = params['id']
end

def update
  @comment = Comment.find(params[:id])
  if @comment.update(

    content: params[:content], 
    user: User.all.sample
    )
    
    redirect_to '/'
  else
    render :edit
  end
end

def destroy
  @comment = Comment.find(params['id'])
  @comment.destroy
  redirect_to '/'
end  

end