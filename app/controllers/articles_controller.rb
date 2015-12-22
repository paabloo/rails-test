class ArticlesController < ApplicationController

    def index
        render json: Article.all
    end

    def show
        render json: Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            render json: '{"status": "success"}'
        else
            render json: '{"status": "error"}'
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            render json: '{"status": "success"}'
        else
            render json: '{"status": "error"}'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            render json: '{"status": "success"}'
        else
            render json: '{"status": "error"}'
        end
    end

    def custom
        render json: {head: 'none', yes: 'of course', yyy: true}
    end

    private
        def article_params
        params.require(:article).permit(:title, :text)
    end
end
