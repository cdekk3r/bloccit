module TopicsHelper
    def user_is_authorized_for_topics?
        current_user && current_user.admin?
    end
    
    def mod_is_authorized_for_topics?
        current_user && current_user.moderator? #|| current_user.admin?
    end
end
