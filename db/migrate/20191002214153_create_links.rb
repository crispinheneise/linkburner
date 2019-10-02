# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
    create_table :links, id: :uuid do |t|
      t.text :content
      t.string :token

      t.timestamps
    end
  end
end
