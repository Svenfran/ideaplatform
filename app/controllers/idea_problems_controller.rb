class IdeaProblemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]
    before_action :set_idea_problem, only: %i[show update destroy]

    def index
        @idea_problems = IdeaProblem.all
        @categories = Category.all
    end

    def new
        @idea_problem = IdeaProblem.new
        # authorize @idea_problem
    end

    def show; end
    
    def create
        @idea_problem = IdeaProblem.new(idea_problem_params)
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

    private

    def set_idea_problem
        @idea_problem = IdeaProblem.find(params[:id])
    end

    def idea_problem_params
        params.require(:idea_problem).permit(:title, :description_long, :type_idea, :status_open, category_ids: [])
    end
 
end
