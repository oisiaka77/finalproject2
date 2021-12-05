class ItemsController < ApplicationController
  def index
    matching_items = Item.all

    @list_of_items = matching_items.order({ :created_at => :desc })

    render({ :template => "items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_items = Item.where({ :id => the_id })

    @the_item = matching_items.at(0)

    render({ :template => "items/show.html.erb" })
  end

  def create
    the_item = Item.new
    the_item.description = params.fetch("query_description")
    the_item.price = params.fetch("query_price")
    the_item.store_id = params.fetch("query_store_id")
    the_item.item_url = params.fetch("query_item_url")
    the_item.clothing_category_id = params.fetch("query_clothing_category_id")

    if the_item.valid?
      the_item.save
      redirect_to("/items", { :notice => "Item created successfully." })
    else
      redirect_to("/items", { :notice => "Item failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.description = params.fetch("query_description")
    the_item.price = params.fetch("query_price")
    the_item.store_id = params.fetch("query_store_id")
    the_item.item_url = params.fetch("query_item_url")
    the_item.clothing_category_id = params.fetch("query_clothing_category_id")

    if the_item.valid?
      the_item.save
      redirect_to("/items/#{the_item.id}", { :notice => "Item updated successfully."} )
    else
      redirect_to("/items/#{the_item.id}", { :alert => "Item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully."} )
  end
end
