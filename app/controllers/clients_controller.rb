class ClientsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  #GET clients
  #GET clients.json
  def index
    @clients = Client.all
    respond_to do |format|
      format.html
      format.xml { render xml: @clients.as_json }
    end
  end

  #GET clients/1
  #GET clients/1.json
  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @client.as_json }
    end
  end
  #get clients new
  def new
    @client = Client.new
    respond_to do |format|
      format.html
      format.xml { render xml: @client.as_json }
    end
  end
  
  #POST/clients
  #POST/clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

   # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:firstName, :lastName, :nationalID, :phone)
    end
  end