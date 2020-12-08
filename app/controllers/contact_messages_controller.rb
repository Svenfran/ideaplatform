class ContactMessagesController < ApplicationController
    before_action :set_idea_problem, only: [:new, :create, :confirmation]

    def new
        @contact_message = ContactMessage.new
    end

    def create
        @contact_message = ContactMessage.new(contact_params)
        @contact_message.recipient_name = @idea_problem.user.first_name
        @contact_message.recipient_email = @idea_problem.user.email
        @contact_message.recipient_idea_problem_title = @idea_problem.title
        @contact_message.recipient_idea_problem_id = @idea_problem.id
        @contact_message.user = current_user
        
        if @contact_message.save
            UserContactMailer.notification(@contact_message).deliver_now
            redirect_to idea_problem_confirmation_path(@idea_problem, @contact_message)
        else
            render :new
        end
    end

    def confirmation; end

    private

    def set_idea_problem
        @idea_problem = IdeaProblem.find(params[:idea_problem_id])
    end

    def contact_params
        params.require(:contact_message).permit(:sender_subject, :sender_email, :sender_message)
        # params.require(:contact_message).permit(:sender:subject, :sender_email, :sender_message, :recipient_name, :recipient_email, :recipient_idea_problem_id, :recipient_idea_problem_title)
    end

end
