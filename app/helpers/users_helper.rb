module UsersHelper
   def user_has_posts?(user)
      user.posts.size > 0
   end
   
   def user_has_comments?(user)
      user.comments.size > 0
   end
end
