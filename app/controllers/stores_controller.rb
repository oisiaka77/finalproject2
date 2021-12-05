class StoresController < ApplicationController
  def index
    matching_stores = Store.all

    @list_of_stores = matching_stores.order({ :created_at => :desc })

    render({ :template => "stores/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stores = Store.where({ :id => the_id })

    @the_store = matching_stores.at(0)

    matching_items = Item.all

    @list_of_items = matching_items.order({ :created_at => :desc })

    render({ :template => "stores/show.html.erb" })
  end

  def create
    the_store = Store.new
    the_store.name = params.fetch("query_name")
    the_store.address = params.fetch("query_address")

    if the_store.valid?
      the_store.save
      redirect_to("/stores", { :notice => "Store created successfully." })
    else
      redirect_to("/stores", { :notice => "Store failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_store = Store.where({ :id => the_id }).at(0)

    the_store.name = params.fetch("query_name")
    the_store.address = params.fetch("query_address")

    if the_store.valid?
      the_store.save
      redirect_to("/stores/#{the_store.id}", { :notice => "Store updated successfully."} )
    else
      redirect_to("/stores/#{the_store.id}", { :alert => "Store failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_store = Store.where({ :id => the_id }).at(0)

    the_store.destroy

    redirect_to("/stores", { :notice => "Store deleted successfully."} )
  end
end
