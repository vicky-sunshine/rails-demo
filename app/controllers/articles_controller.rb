class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    find_article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    
  end

  # POST /articles
  def create
    @article = Article.new(article_params)


    if @article.save
      redirect_to articles_path, notice: "save success"
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    @article = Article.new(article_params)


    if @article.save
      redirect_to articles_path, notice: "save success"
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    article = Article.find_by(id: params[:id])
    redirect_to articles_path, notice: "article not found" unless article

    article.destroy
    redirect_to articles_path, notice: "article delete success"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title)
    end
    
    def find_article
      @artilce = Article.find_by(id: params[:id])
      redirect_to articles_path, notice: "article not found" unless @article
    end
end
