class CreateLabelsPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :labels_posts do |t|
      t.references :label, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
