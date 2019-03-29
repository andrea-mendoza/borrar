class CommentsController < ApplicationController

    def index
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @comments = @paper.comments
        @reviews = @paper.reviews
        respond_to do |format|
            format.html
            format.pdf { render template: 'comments/inform', pdf: 'Informe', layout: 'pdf.html' }
        end
    end
        
    def create
        @event = Event.find(params[:event_id])
        @paper = @event.papers.find(params[:paper_id])
        @comment = @paper.comments.create(comment_params)
        redirect_to event_paper_reviews_url(@event, @paper)
    end

    def comment_params
        params.require(:comment).permit(:commentary, :user_id)
    end
end
