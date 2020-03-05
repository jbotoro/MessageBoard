class CommentsController < ApplicationController
    # before doing anything with comment find post that 
    # comment will be associated with, likewise for finding comment for edit update
    # destroy actions

    before_action :find_post
    before_action :find_comment, only: [:edit, :update, :destroy]

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to post_path(@post)
    end


    private

        def comment_params
            params.require(:comment).permit(:body)
        end
        # since edit, create and destroy will have to find a post
        # I can clean up repetition by using this find post method
        def find_post
            @post = Post.find(params[:post_id])
        end

        # since edit, create and destroy will have to find a specific comment
        # I can clean up repetition by using this find comment method

        def find_comment
            @comment = @post.comments.find(params[:id])
        end


end
