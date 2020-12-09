class UsersController < ApplicationController

    def index
        user = current_user
        @idea_problems = IdeaProblem.where(user_id: user).order(type_idea: :desc)
        @contact_messages = ContactMessage.where(user_id: user).order(created_at: :desc)
    end

end
