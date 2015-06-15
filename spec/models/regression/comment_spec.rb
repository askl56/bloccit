require 'rails_helper'

RSpec.describe Comment, regressor: true do
  # === Relations ===
  it { is_expected.to belong_to :post }
  it { is_expected.to belong_to :user }

  # === Nested Attributes ===

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :body }
  it { is_expected.to have_db_column :post_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :user_id }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ['user_id'] }
  it { is_expected.to have_db_index ['post_id'] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(5)).for :body }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(4)).for :body }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_presence_of :user }

  # === Validations (Numericality) ===

  # === Enums ===
end
