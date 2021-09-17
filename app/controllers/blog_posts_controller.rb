class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:update, :destroy]

  # POST /blog_posts
  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to presenter_path(:show, post_id: @blog_post.id,
                                 notice: 'Blog post was successfully created.'), status: :see_other

    else
      render :new
    end
  end

  # PATCH/PUT /blog_posts/1
  def update
    if @blog_post.update(blog_post_params)
      redirect_to presenter_path(:show, post_id: @blog_post.id,
                                 notice: 'Blog post was successfully updated.'), status: :see_other

    else
      render :edit
    end
  end

  # DELETE /blog_posts/1
  def destroy
    @blog_post.destroy
    redirect_to presenter_path(:index, notice: 'Blog post was successfully destroyed.'), status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_post_params
      params.permit(:id, :name, :title, :content)
    end

  # TODO -- need to refactor this out of here
  def presenter_path(presenter, **args)
    url = "/blog_posts#{presenter==:index ? '' : "/#{presenter}"}?#{args.merge(accepts_html: true).to_query}"
    url
  end
end
