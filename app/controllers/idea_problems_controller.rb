class IdeaProblemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]
    before_action :set_idea_problem, only: %i[show edit update destroy]

    def index
        @idea_problems = IdeaProblem.all
        @categories = Category.all
    end

    def new
        @idea_problem = IdeaProblem.new
        # @attachment = Attachment.new
        # authorize @idea_problem
    end

    def show; end
    
    def create
        @idea_problem = IdeaProblem.new(idea_problem_params)
        # @attachment = Attachment.new(attachment_params)
        # @idea_problem.attachment = @attachment
        # @idea_problem.attachments.attach(params[:attachments])
        @idea_problem.user = current_user
        # authorize @idea_problem

        if @idea_problem.save
            if @idea_problem.type_idea
                redirect_to idea_problems_path, notice: "Idea successfully created."
            else
                redirect_to idea_problems_path, notice: "Problem successfully created."
            end
        else
            render :new
        end
    end

    def edit; end

    def update
        if @idea_problem.update(idea_problem_params)
            if @idea_problem.type_idea
                redirect_to idea_problem_path, notice: "Idea successfully updated."
            else
                redirect_to idea_problem_path, notice: "Problem successfully updated."
            end
        else
            render :edit
        end
    end

    def destroy
        @idea_problem.destroy
        redirect_to idea_problems_path
    end


    private

    def set_idea_problem
        @idea_problem = IdeaProblem.find(params[:id])
    end

    def idea_problem_params
        params.require(:idea_problem).permit(:title, :description_long, :type_idea, :status_open, category_ids: [], documents: [])
    end

    # def attachment_params
    #     params.require(:attachment).permit(:title, :size, :idea_problem_id)
    # end
 
end
