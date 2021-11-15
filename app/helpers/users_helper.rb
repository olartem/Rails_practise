module UsersHelper
    

    def has_liked_posts?(user)
        max = 0
        
        user.microposts.each do |micropost|
            micropost.get_upvotes.size
            if max < (micropost.get_upvotes.size) 
                max = micropost.get_upvotes.size
                @best_micropost = micropost
            end
        end 
        if (@best_micropost.nil?)    
            false            
        else
            true
        end
    end

    def last_action(user)
        votes = user.get_voted Micropost
        last = 30.day.ago
        votes.each do |vote|
            if vote.created_at < last
                last = vote.created_at
            end
        end 
        if !user.microposts.empty?
            [user.microposts.last.created_at, user.microposts.last.updated_at, last].max
        else
            user.created_at
        end
    end
end
