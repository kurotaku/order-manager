class AddPartnerToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :line_items, :partner, foreign_key: true
  end
end
