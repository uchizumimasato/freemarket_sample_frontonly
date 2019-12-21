class CategoriesController < ApplicationController
  before_action :set_ransack_q

  def index
    @p_categories = Category.where(id: [1, 11])
  end

  def search
    if params[:id] == "1" || params[:id] == "11"
      num = params[:id].to_i + 9
      categories = Category.where("id <= ?", num)
      ids = []
      categories.each do |c|
        ids << c.id
      end
      @items = Item.where(category_id: ids)
    elsif params[:id] == "2" || params[:id] == "3" || params[:id] == "12" || params[:id] == "13"
      category = Category.find(params[:id])
      ids = []
      category.children.each do |chil|
        ids << chil.id
      end
      @items = Item.where(category_id: ids)
    else
      @items = Item.where(category_id: params[:id])
    end
  end

  private

  def set_ransack_q
    @q = Item.ransack(params[:q])
  end
end
