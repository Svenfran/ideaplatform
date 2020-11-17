class IdeaProblemsController < ApplicationController

    def index
        @idea_problems = IdeaPoblem.all
    end
end
