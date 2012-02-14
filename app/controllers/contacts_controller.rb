class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.json { render json: nil, status: :ok }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end
