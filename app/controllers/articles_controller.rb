class ArticlesController < ApplicationController
  before_action :create_user_only, only: [:edit, :update, :destroy]
  
  def index
    search = Category.find_by(name: "探索")
    sort = Category.find_by(name: "ソート")
    tree = Category.find_by(name: "木構造")
    dp = Category.find_by(name: "動的計画法")
    graph = Category.find_by(name: "グラフ")
    w_graph = Category.find_by(name: "重み付きグラフ")
    integer = Category.find_by(name: "整数論")
    sum = Category.find_by(name: "累積和")
    bit = Category.find_by(name: "bit")

    @search = search.articles
    @sort = sort.articles
    @tree = tree.articles
    @dp = dp.articles
    @graph = graph.articles
    @w_graph = w_graph.articles
    @integer = integer.articles
    @sum = sum.articles
    @bit = bit.articles

  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if params[:back].present?
      render :new
      return
    end

    if @article.save
      redirect_to root_path, notice: "記事「#{@article.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update!(article_params)
    redirect_to root_path, notice: "記事「#{@article.title}」を更新しました。"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, notice: "記事「#{@article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end

  def create_user_only
    article = Article.find(params[:id])
    redirect_to root_path if(article.user != current_user)
  end
end
