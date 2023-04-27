class BlogPostsController < ApplicationController
    before_action :set_blog_post, except:[:index , :new, :create]
    def index
        @blog_posts = BlogPost.all
    end

    def show
        # @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        
        if @blog_post.save
            redirect_to @blog_post
        else
            render :new , status: :unprocessable_entity
        end
    end

    def edit
        # @blog_post = BlogPost.find(params[:id])
    end


    def update
        # @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else 
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy 
        # @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy()
        redirect_to root_path
    end

    # The purpose of the method is to define a "strong parameters" whitelist of the parameters that are allowed to be passed into the create and update actions of the controller. It does this by taking the params object, which is a hash containing all the HTTP parameters that were sent in the request, and calling the require method on it with the key :blog_post. This ensures that only parameters that are associated with a blog_post object will be permitted.

    # Then, the permit method is called on the resulting object to specify which attributes of the blog_post object are allowed to be mass-assigned. In this case, the :title and :body attributes are permitted, which means that only those parameters will be used to create or update the blog_post object in the database.

    private 
    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
end