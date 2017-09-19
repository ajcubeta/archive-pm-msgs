class WebhookEventRequestsController < ApplicationController
  before_action :set_webhook_event_request, only: [:show, :edit, :update, :destroy]

  protect_from_forgery except: :webhook

  def webhook
    request.body.rewind
    @webhook_event_request = WebhookEventRequest.new(payload: request.body.read)

    if @webhook_event_request.save
      render json: @webhook_event_request, status: :created
    else
      render json: @webhook_event_request.errors,
        status: :unprocessable_entity
    end
  end

  # GET /webhook_event_requests
  # GET /webhook_event_requests.json
  def index
    @webhook_event_requests = WebhookEventRequest.all
  end

  # GET /webhook_event_requests/1
  # GET /webhook_event_requests/1.json
  def show
  end

  # GET /webhook_event_requests/new
  def new
    @webhook_event_request = WebhookEventRequest.new
  end

  # GET /webhook_event_requests/1/edit
  def edit
  end

  # POST /webhook_event_requests
  # POST /webhook_event_requests.json
  def create
    @webhook_event_request = WebhookEventRequest.new(webhook_event_request_params)

    respond_to do |format|
      if @webhook_event_request.save
        format.html { redirect_to @webhook_event_request, notice: 'Webhook event request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @webhook_event_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @webhook_event_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webhook_event_requests/1
  # PATCH/PUT /webhook_event_requests/1.json
  def update
    respond_to do |format|
      if @webhook_event_request.update(webhook_event_request_params)
        format.html { redirect_to @webhook_event_request, notice: 'Webhook event request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @webhook_event_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webhook_event_requests/1
  # DELETE /webhook_event_requests/1.json
  def destroy
    @webhook_event_request.destroy
    respond_to do |format|
      format.html { redirect_to webhook_event_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webhook_event_request
      @webhook_event_request = WebhookEventRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webhook_event_request_params
      params.require(:webhook_event_request).permit(:payload)
    end
end
