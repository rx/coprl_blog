module BlogPostsHelper
  def blog_post
    BlogPost.find(params[:post_id])
  end

  def blog_posts
    BlogPost.all
  end

  def confirm_delete_dialog
    blog_posts.each do |blog_post|
      dialog id: "are_you_sure#{blog_post.id}" do
        text 'Are you sure?'
        actions do
          button 'Cancel'
          button "Yes I'm sure", color: :red do
            event :click do
              deletes blog_post_path(blog_post)
            end
          end
        end
      end
    end
  end
end
