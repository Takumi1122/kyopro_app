class ProblemsController < ApplicationController
  before_action :create_user_only, only: [:edit, :update, :destroy]

  def all_problem
    @problems = Problem.all
  end

  def index
    @article = Article.find(params[:article_id])
    @problems = @article.problems
  end

  def show
    @article = Article.find(params[:article_id])
    @problem = Problem.find(params[:id])
  end

  def new
    @article = Article.find(params[:article_id])
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.article_id = params[:article_id]

    if @problem.save
      redirect_to article_problem_path, notice: "問題「#{@problem.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    @problem.update!(problem_params)
    redirect_to article_problem_path, notice: "問題「#{@problem.title}」を更新しました。"
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to root_path, notice: "記事「#{@problem.title}」を削除しました。"
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :body, :link, :answer)
  end

  def create_user_only
    article = Article.find(params[:article_id])
    redirect_to root_path if(article.user != current_user)
  end
end
