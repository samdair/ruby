class CommentsController < ApplicationController
  before_action :authenticate
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :get_parent
  before_filter :load_article, :except => :destroy
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
     @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
     @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if (@comment.owned_by? current_user) || (!current_user.nil? && current_user.admin?)
      else
     redirect_to login_path, notice: 'Please login'
   end
  end

  # POST /comments
  # POST /comments.json
  def create
    
  @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @article = Article.find(params[:article_id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
    
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
   @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if (@comment.owned_by? current_user) || (!current_user.nil? && current_user.admin?)
     @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.json { head :no_content }
    end
    else
     redirect_to login_path, notice: 'Please login'
   end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_parent
    @parent = Article.find_by_id(params[:article_id]) if params[:article_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end
  def load_article
    @article = Article.find(params[:article_id])
  end
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :email, :body, :commentable_id, :commentable_type, :article_id)
    end
end
