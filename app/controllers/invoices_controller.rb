class InvoicesController < ApplicationController

  before_filter :authenticate_user!

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.invoices .search(params[:search])
    respond_with(@invoices)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    respond_with(@invoice)
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    respond_with(@invoice)
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

# POST /invoices
# POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.user_id = current_user.id
    @invoice.save
    respond_with(@invoice)
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params[:invoice])
    respond_with(@invoice)
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    respond_with(@invoice)
  end
end
