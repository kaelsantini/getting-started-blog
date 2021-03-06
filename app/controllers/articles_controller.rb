class ArticlesController < ApplicationController

    def index
      @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
        render 'edit'
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        respond_to do |format|
         if @article.save
           format.html { redirect_to @article }
           format.json { render json: @article, status: :created, location: @article }
         else
           format.json { render json: @article.errors, status: :unprocessable_entity }
         end
       end
    end

    def update
        @article = Article.find(params[:id])

        respond_to do |format|
          if @article.update(article_params)
            format.html { redirect_to @article }
            format.json { render json: @article, status: :created, location: @article }
          else
            format.json { render json: @article.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
