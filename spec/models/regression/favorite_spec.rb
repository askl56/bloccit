require 'rails_helper'

RSpec.describe Favorite, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user}
	it { is_expected.to belong_to :post}
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :user_id }
	it { is_expected.to have_db_column :post_id }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["post_id"]}
	it { is_expected.to have_db_index ["user_id"]}

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end