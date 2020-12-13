class IdeaProblemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]
    before_action :set_idea_problem, only: %i[show edit update destroy create_attachment]
    before_action :set_idea_problem_attachment, only: %i[delete_attachment]

    def index
        if params[:filter].present?
            # raise
            if params[:filter].include?("true") && params[:filter].include?("false")
                params[:filter].delete_if {|val| val == "true" || val == "false"}
                @idea_problems = IdeaProblem.includes(:categories) if params[:filter].length == 0
                @idea_problems = IdeaProblem.search_by_category_type(params[:filter]) if params[:filter].length > 0
            else
                @idea_problems = IdeaProblem.search_by_category_type(params[:filter])
            end
        
        elsif params[:query].present?
            @idea_problems = IdeaProblem.search_by_title_description_category(params[:query])
        else
            @idea_problems = IdeaProblem.includes(:categories)
        end
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
                redirect_to idea_problems_path(@idea_problem, anchor: "item-#{@idea_problem.id}"), notice: "Idea successfully created."
            else
                redirect_to idea_problems_path(@idea_problem, anchor: "item-#{@idea_problem.id}"), notice: "Problem successfully created."
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

    # handle attachments
    
    def create_attachment
        documents = params[:documents]
        if documents
            documents.each do |document|
                @idea_problem.documents.attach(document)
            end
        end
        redirect_to idea_problem_path(@idea_problem)
    end

    def delete_attachment
        @document = ActiveStorage::Attachment.find(params[:id])
        @document.purge
        redirect_to idea_problem_path(@idea_problem)
    end

    private

    def set_idea_problem
        @idea_problem = IdeaProblem.find(params[:id])
    end
    
    def set_idea_problem_attachment
        @idea_problem = ActiveStorage::Attachment.find(params[:id]).record_id
    end

    def idea_problem_params
        params.require(:idea_problem).permit(:title, :description_long, :type_idea, :status_open, category_ids: [], documents: [])
    end
    
end
