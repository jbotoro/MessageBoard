class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC')
    end


    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def new
        @post = Post.new
    end

    ##private post params

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

end
