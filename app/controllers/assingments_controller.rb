class AssingmentsController < ApplicationController
    load_and_authorize_resource :paper
    load_and_authorize_resource :assingment, through: :paper, singleton: true

    def new
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @assingment = @paper.build_assingment
    end

    def create
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        if(params[:assingment][:tutor_id]==params[:assingment][:relator_id])
            redirect_to new_event_paper_assingment_path(@event), alert: 'Tutor y relator no pueden ser iguales.'
        else
            @assingment = @paper.create_assingment(assingment_params)
            if @assingment.save
                AssignmentMailer.tribunal_confirmation(@assingment, @paper, @event).deliver
                redirect_to event_papers_path(@event), alert: 'Se envió una notificación por correo'
            else
                render :new
            end
        end
    end

    def edit
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @assingment = Assingment.find(params[:id])
    end

    def update
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        if(params[:assingment][:tutor_id]==params[:assingment][:relator_id])
            redirect_to edit_event_paper_assingment_path(@event), alert: 'Tutor y relator no pueden ser iguales.'
        else
            @assingment = Assingment.find(params[:id])
            if @assingment.update(assingment_params)
                AssignmentMailer.tribunal_confirmation(@assingment, @paper, @event).deliver
                redirect_to event_papers_path(@event), alert: 'Se envió una notificación por correo'
            else
                render :edit
            end
        end
    end

    def show
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @assingment = Assingment.find(params[:id])
    end

    private
    def assingment_params
        params.require(:assingment).permit(:director_id, :tutor_id, :relator_id)
    end
end
