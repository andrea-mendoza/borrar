class SurveysController < ApplicationController
    load_and_authorize_resource :event
    load_and_authorize_resource :survey, through: :event, singleton: true

    def show
        @event = Event.find(params[:event_id])
        @survey = Survey.find(params[:id])
    end

    def new
        @event = Event.find(params[:event_id])
        @survey = @event.build_survey
        @survey.questions.build(type: Question.default_type)
    end

    def create
        @event = Event.find(params[:event_id])
        @survey = @event.create_survey(survey_params)
        if @survey.save
            redirect_to events_path
        else
            render :new
        end
    end

    def destroy
        @survey = Survey.find(params[:id]).destroy
        redirect_to events_path
    end

    private
    def survey_params
        params.require(:survey).permit(:name, :event_id,
            questions_attributes: [:id, :title, :description, :type, :max_score, :_destroy,
                options_attributes: [:id, :point, :description, :_destroy]])
    end
end
