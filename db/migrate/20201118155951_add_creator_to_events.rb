class AddCreatorToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, index: true
  end
end
