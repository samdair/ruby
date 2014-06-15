class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :load_article, :except => :destroy
  before_filter :authenticate, :only => :destroy

  def create    
    @comment = @article.comments.new(comment_params)
    #@comment.article.user_id = current_user.id
    if @comment.save
      #Notifier.comment_added(@comment).deliver
      respond_to do |format|
        format.html { redirect_to @article, notice: 'Thanks for your comment' }
        #format.json { render action: 'show', status: :created, location: @article }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @article, alert: 'Unable to add comment' }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end
  
  def edit  
  end
  
  def show
    
  end
  
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @article, :notice => 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comment Deleted' }
      format.js
    end
  end

  private
  def load_article
    @article = Article.find(params[:article_id])
  end
  def set_comment
      @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
