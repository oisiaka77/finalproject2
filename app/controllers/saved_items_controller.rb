class SavedItemsController < ApplicationController
  def index
    matching_saved_items = SavedItem.all

    @list_of_saved_items = matching_saved_items.order({ :created_at => :desc })

    render({ :template => "saved_items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_saved_items = SavedItem.where({ :id => the_id })

    @the_saved_item = matching_saved_items.at(0)

    render({ :template => "saved_items/show.html.erb" })
  end

  def create
    the_saved_item = SavedItem.new
    the_saved_item.user_id = params.fetch("query_user_id")
    the_saved_item.item_id = params.fetch("query_item_id")

    if the_saved_item.valid?
      the_saved_item.save
      redirect_to("/saved_items", { :notice => "Saved item created successfully." })
    else
      redirect_to("/saved_items", { :notice => "Saved item failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_saved_item = SavedItem.where({ :id => the_id }).at(0)

    the_saved_item.user_id = params.fetch("query_user_id")
    the_saved_item.item_id = params.fetch("query_item_id")

    if the_saved_item.valid?
      the_saved_item.save
      redirect_to("/saved_items/#{the_saved_item.id}", { :notice => "Saved item updated successfully."} )
    else
      redirect_to("/saved_items/#{the_saved_item.id}", { :alert => "Saved item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_saved_item = SavedItem.where({ :id => the_id }).at(0)

    the_saved_item.destroy

    redirect_to("/saved_items", { :notice => "Saved item deleted successfully."} )
  end
end
