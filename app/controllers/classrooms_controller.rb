class ClassroomsController < ApplicationController
    load_and_authorize_resource :paper
    load_and_authorize_resource :classroom, through: :paper, singleton: true
    
    def new
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @classroom = @paper.build_classroom
    end

    def create
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @classroom = @paper.create_classroom(classroom_params)
        if @classroom.save
            redirect_to event_papers_path(@event)
        else
            render :new
        end
    end

    def edit
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @classroom = Classroom.find(params[:id])
    end

    def update
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @classroom =  Classroom.find(params[:id])
        @classroom.update(classroom_params)
        redirect_to event_papers_path(@event)
    end

    def show
        edit()
    end

    private
    def classroom_params
        params.require(:classroom).permit(:ambient, :defense_date, :defense_hour, :paper_id)
    end
end