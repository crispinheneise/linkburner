# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :set_link, only: %i[show edit update destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link.destroy unless flash[:just_created] || params[:do_not_destroy]
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    flash[:just_created] = true

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'This link will disappear the next time someone sees it.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'expired'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:content)
  end
end
