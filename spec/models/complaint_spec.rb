require 'rails_helper'

RSpec.describe Complaint, type: :model do
  it { is_expected.to belong_to(:state) }
  it { is_expected.to belong_to(:city) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:cep) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:city) }

  let(:complaint) { build(:complaint) }

  it 'allows attaching a picture' do
    complaint.picture = Refile::FileDouble.new('f', 'f.png')
    complaint.save
    expect(complaint.picture_id).to_not be_nil
  end
end
