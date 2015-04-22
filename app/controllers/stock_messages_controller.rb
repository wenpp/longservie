class StockMessagesController < BaseController
  before_action :set_stock_message, only: [:show, :edit, :update, :destroy]

  # GET /stock_messages
  # GET /stock_messages.json
  def index
    @stock_messages = StockMessage.all
  end

  # GET /stock_messages/1
  # GET /stock_messages/1.json
  def show
  end

  # GET /stock_messages/new
  def new
    @stock_message = StockMessage.new
  end

  # GET /stock_messages/1/edit
  def edit
  end

  # POST /stock_messages
  # POST /stock_messages.json
  def create
    @stock_message = StockMessage.new(stock_message_params)

    respond_to do |format|
      if @stock_message.save
        format.html { redirect_to @stock_message, notice: 'Stock message was successfully created.' }
        format.json { render :show, status: :created, location: @stock_message }
      else
        format.html { render :new }
        format.json { render json: @stock_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_messages/1
  # PATCH/PUT /stock_messages/1.json
  def update
    respond_to do |format|
      if @stock_message.update(stock_message_params)
        format.html { redirect_to @stock_message, notice: 'Stock message was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_message }
      else
        format.html { render :edit }
        format.json { render json: @stock_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_messages/1
  # DELETE /stock_messages/1.json
  def destroy
    @stock_message.destroy
    respond_to do |format|
      format.html { redirect_to stock_messages_url, notice: 'Stock message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_message
      @stock_message = StockMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_message_params
      params.require(:stock_message).permit(:message)
    end
end
