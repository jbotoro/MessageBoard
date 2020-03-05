class PostsController < ApplicationController

    def index

    end


    def create
        @post = Post.new(post_params)
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
