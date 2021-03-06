class ArticlesController < ApplicationController
  	def index
    @articles = Article.all
	end
	
	def show
	@article = Article.find(params[:id])
	end
	
	def new
	@article = Article.new 
	@categories = Category.all.map{|c| [ c.name, c.id ] }
	end

	def edit
	@article = Article.find(params[:id])
	@categories = Category.all.map{|c| [ c.name, c.id ] }
	end

	def create
	@article = Article.new(article_params)
	@article.category_id = params[:category_id] 

  	if @article.save
  		redirect_to @article
	else
		render 'new'
	end
	end

	def update
	  @article = Article.find(params[:id])
	  @article.category_id = params[:category_id]
 
 	 if @article.update(article_params)
    		redirect_to @article
  	else
    		render 'edit'
  	end
	end

	def destroy
  	@article = Article.find(params[:id])
 	 @article.destroy
 
 	 redirect_to articles_path
	end

 
	private
  	def article_params
    		params.require(:article).permit(:title, :text, :deadline)
  	end
end
