require 'rails_helper'

RSpec.describe Proposal, :type => :model do
  subject {
    described_class.new(
      name: 'valid_name',
      description: 'valid description',
      value: 2500.00,
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a value" do
    subject.value = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid

  end
  it "is not valid without a start_date > end_date" do
    subject.start_date = '02/01/2022'
    subject.end_date = '01/01/2022'
    expect(subject).to_not be_valid
  end
  it 'is not valid with NaN as value' do
    subject.value = 'invalid'
    expect(subject).to_not be_valid
  end
  it 'is not valid with a value <= 0' do
    subject.value = -0.1
    expect(subject).to_not be_valid
  end
end