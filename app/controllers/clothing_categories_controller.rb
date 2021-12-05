class ClothingCategoriesController < ApplicationController
  def index
    matching_clothing_categories = ClothingCategory.all

    @list_of_clothing_categories = matching_clothing_categories.order({ :created_at => :desc })

    render({ :template => "clothing_categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_clothing_categories = ClothingCategory.where({ :id => the_id })

    @the_clothing_category = matching_clothing_categories.at(0)

    matching_items = Item.all

    @list_of_items = matching_items.order({ :created_at => :desc })

    render({ :template => "clothing_categories/show.html.erb" })
  end

  def create
    the_clothing_category = ClothingCategory.new
    the_clothing_category.category_name = params.fetch("query_category_name")

    if the_clothing_category.valid?
      the_clothing_category.save
      redirect_to("/clothing_categories", { :notice => "Clothing category created successfully." })
    else
      redirect_to("/clothing_categories", { :notice => "Clothing category failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_clothing_category = ClothingCategory.where({ :id => the_id }).at(0)

    the_clothing_category.category_name = params.fetch("query_category_name")

    if the_clothing_category.valid?
      the_clothing_category.save
      redirect_to("/clothing_categories/#{the_clothing_category.id}", { :notice => "Clothing category updated successfully."} )
    else
      redirect_to("/clothing_categories/#{the_clothing_category.id}", { :alert => "Clothing category failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_clothing_category = ClothingCategory.where({ :id => the_id }).at(0)

    the_clothing_category.destroy

    redirect_to("/clothing_categories", { :notice => "Clothing category deleted successfully."} )
  end
end
