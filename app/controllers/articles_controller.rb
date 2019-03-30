class ArticlesController < ApplicationController
  # Calls methods on certain pages
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # Important to have these actions in order

  def new
    # Creates a new instance of Article
    @article = Article.new
  end

  def edit
  end

  def index
    # Finds all articles and paginates them
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def create
    # Creates new article given article parameters
    @article = Article.new(article_params)
    @article.user = current_user
    # Conventional syntax
    if @article.save
      flash[:success] = "Article was succefully created"
      redirect_to article_path(@article)
    else
      render 'new' # or :new
    end
  end

  def update
    # Updates article given article parameters
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    # Deletes instance of article
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  # All methods under 'private' can only be called implicitly in controller
  private
    # Sets instance of an article with certain params
    def set_article
      @article = Article.find(params[:id])
    end

    # Sets params with requirements for articles
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end

    # True if loggin in user is the same as user who wrote article or admin
    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end

end
