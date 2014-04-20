class EntriesController < InheritedResources::Base
  load_and_authorize_resource

  def create
    Entry.create(entry_params)
    redirect_to root_path
  end

  def destroy
    Entry.find_by(id: params[:id]).try(:destroy)
    redirect_to root_path, status: 303
  end

  private

  def permitted_params
    params.permit(entry: [:name, :entry_type_id, :amount])
  end

  def entry_params
    params.require(:entry).permit(:name, :entry_type_id, :amount)
  end
end
