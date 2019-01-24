class ArticlesController < ActionController::Base

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # Conventional syntax
    if @article.save
      flash[:notice] = "Article was succefully created"
      redirect_to article_path(@article)
    else
      render 'new' # or :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
