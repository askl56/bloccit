require 'rails_helper'

RSpec.describe Post, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user}
	it { is_expected.to belong_to :topic}
  
  it { is_expected.to have_many :comments}
	it { is_expected.to have_many :votes}
	it { is_expected.to have_many :favorites}

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :title }
	it { is_expected.to have_db_column :body }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }
	it { is_expected.to have_db_column :user_id }
	it { is_expected.to have_db_column :topic_id }
	it { is_expected.to have_db_column :rank }
	it { is_expected.to have_db_column :image }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["topic_id"]}
	it { is_expected.to have_db_index ["user_id"]}

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(5)).for :title }
	it { is_expected.not_to allow_value(Faker::Lorem.characters(4)).for :title }
	it { is_expected.to allow_value(Faker::Lorem.characters(20)).for :body }
	it { is_expected.not_to allow_value(Faker::Lorem.characters(19)).for :body }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }
	it { is_expected.to validate_presence_of :body }
	it { is_expected.to validate_presence_of :topic }
	it { is_expected.to validate_presence_of :user }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end