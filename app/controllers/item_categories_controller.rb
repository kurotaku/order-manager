class ItemCategoriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_item_category, only: [:edit, :update, :destroy]
  
  def index
    @item_categories = ItemCategory.all
  end
  
  def new
    @item_category = ItemCategory.new
  end

  def create
    @item_category = ItemCategory.new(item_category_params)
    if @item_category.save
      flash[:success] = '部材カテゴリーを登録しました'
      redirect_to item_categories_url
    else
      flash.now[:danger] = '部材カテゴリーの登録に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @item_category.update(item_category_params)
      flash[:success] = '部材カテゴリーを編集しました'
      redirect_to item_categories_url
    else
      flash.now[:danger] = '部材カテゴリーの編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @item_category.destroy
    
    flash[:success] = '部材カテゴリーは削除されました'
    redirect_to item_categories_url
  end
  
  private
  
  def set_item_category
    @item_category = ItemCategory.find(params[:id])
  end
  
  def item_category_params
    params.require(:item_category).permit(:name)
  end
end