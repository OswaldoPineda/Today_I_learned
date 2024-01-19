class AddSubscriptionToNewsletter < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletters, :subscription, :boolean, default: true 
  end
end
