class ReviewsController < ApplicationController
    load_and_authorize_resource :paper
    load_and_authorize_resource :review, through: :paper
    
    def index
        @event = Event.find(params[:event_id])
        @paper = Paper.find(params[:paper_id])
        @survey = @event.survey
        @reviews = @paper.reviews
        respond_to do |format|
            format.html
            format.pdf { render template: 'reviews/inform', pdf: 'Informe de Revisiones', layout: 'pdf.html' }
        end
    end

    def new
        @event = Event.find(params[:event_id])
        @survey = @event.survey
        @paper = @event.papers.find(params[:paper_id])
        @review = @paper.reviews.build
    end

    def create
        @event = Event.find(params[:event_id])
        @survey = @event.survey
        @paper = @event.papers.find(params[:paper_id])
        @review = @paper.reviews.new(review_params)
        if @review.save
            ReviewMailer.review_notification(current_user, @paper.assingment, @paper, @event).deliver
            redirect_to event_paper_reviews_url(@event, @paper), alert: 'Se envió una notificación por correo'
        else
            render :new
        end
    end

    def show
        @review = Review.find(params[:id])
        @paper = @review.paper
    end

    def edit
        @event = Event.find(params[:event_id])
        @paper = Paper.find(params[:paper_id])
        @review = Review.find(params[:id])
        @survey = @review.survey
    end
    
    def update
        @event = Event.find(params[:event_id])
        @paper = Paper.find(params[:paper_id])
        @review = Review.find(params[:id])
        @review.update(review_params)
        if @review.save
            ReviewMailer.review_notification(current_user, @paper.assingment, @paper, @event).deliver
            redirect_to event_paper_reviews_url(@event, @paper), alert: 'Se envió una notificación por correo'
        else
            render :edit
        end
    end

    private
    def review_params
        params.require(:review).permit(:paper_id, :user_id, :survey_id,
            evaluations_attributes: [:id, :score, :description, :question_id])
    end
end
