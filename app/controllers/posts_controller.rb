class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]
    # using devise, make sure user has to be logged in to create, 
    # edit, update, or destroy posts
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts = Post.all.order('created_at DESC')
    end


    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def new
        @post = current_user.posts.build
    end

    def show
    end

    def update
        if @post.update(post_params)
            redirect_to post_path
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

    ##private post params

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

        def find_post
            @post = Post.find(params[:id])
        end

end
