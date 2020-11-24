class ContactMessagesController < ApplicationController
    before_action :set_idea_problem, only: [:new, :create]

    def new
        @contact_message = ContactMessage.new
    end

    def create
        @contact_message = ContactMessage.new(contact_params)
        @contact_message.idea_problem_id = @idea_problem
        @contact_message.user = current_user
        raise
        if @contact_message.save
            redirect_to idea_problem_path(@idea_problem)
        else
            render :new
        end
    end

    private

    def set_idea_problem
        @idea_problem = IdeaProblem.find(params[:idea_problem_id])
    end

    def contact_params
        params.require(:contact_message).permit(:subject, :email, :message, :user_id, :idea_problem_id)
    end

end
