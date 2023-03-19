class BlogsController < ApplicationController
    def create
        #define response
        blog = Blog.new(title: params[:title], content: params[:content], image_path: params[:image_path])

        if blog.save
            render json: blog, status: :created
        else
            render json: blog.errors, status: :unprocessable_entity
        end 
    end

    def index
        blogs = Blog.all
        render json: blogs, status: :ok
    end

    def show
        blog = Blog.find(params[:id])
        render json: blog, status: :ok
    end

    def update
        blog = Blog.find(params[:id])
        if blog.update(title: params[:title], content: params[:content], image_path: params[:image_path])
            render json: blog, status: :ok
        else
            render json: {errors: blog.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        blog = Blog.find(params[:id])
        blog.destroy
        render json: {message: "Blog deleted"}, status: :ok
    end
end
