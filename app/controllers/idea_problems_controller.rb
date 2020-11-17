class IdeaProblemsController < ApplicationController

    def index
        @idea_problems = IdeaProblem.all
        @categories = Category.all
    end

    def new
        @idea_problem = IdeaProblem.new
        @category = Category.new
        # authorize @idea_problem
    end
    
    def create
        @idea_problem = IdeaProblem.new(idea_problem_params)
        @idea_problem.user = current_user
        # authorize @idea_problem

        if @idea_problem.save
            redirect_to idea_problems_path(params[:id]), notice: "Idea/Problem successfully created."
        else
            render :new
        end

    end

    private

    def set_idea_problem
    end

    def idea_problem_params
        params.require(:idea_problem).permit(:title, :description_long, :type_idea, :type_problem)
    end
end
