class Arts::BuildController < ApplicationController
  include Wicked::Wizard
  steps :new,
        :choose_categories,
        :title_description_confirmation,
        :height_width_confirmation,
        :pricing_confirmation,
        :address_confirmation,
        :upload_photos

  def show
    @art = Art.find(params[:art_id])
    render_wizard
  end

  def update
    @art = Art.find(params[:art_id])
    @art.update!(set_params) if params[:art]
    render_wizard @art
  end

  def create
    @art = Art.new
    @art.user = current_user
    @art.category = Category.first
    @art.save!
    redirect_to wizard_path(steps.first, art_id: @art.id)
  end

  private

  def set_params
    params[:art][:status] = step.to_s
    params[:art][:status] = "active" if step == steps.last
    params[:art][:category_id] = Category.find_by(name: params[:art][:category_id]).id if params[:art][:category_id]
    params.require(:art).permit(:title, :description, :status, :price, :height, :width, :location, :category_id, photos: [])
  end
end
