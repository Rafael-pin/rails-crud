require 'rails_helper'

RSpec.describe Proposal, :type => :model do
  it "is valid with valid attributes" do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      value: 2500.00,
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
    expect(proposal).to be_valid
  end
  it "is not valid without a name" do
    proposal = Proposal.new(
      description: 'valid description',
      value: 2500.00,
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
    expect(proposal).to_not be_valid
  end
  it "is not valid without a description" do
    proposal = Proposal.new(
      name: 'valid_name',
      value: 2500.00,
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
    expect(proposal).to_not be_valid
  end
  it "is not valid without a value" do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
    expect(proposal).to_not be_valid
  end
  it "is not valid without a start_date" do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      value: 2500.00,
      end_date: '02/01/2022'
    )
    expect(proposal).to_not be_valid
  end
  it "is not valid without a end_date" do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      value: 2500.00,
      start_date: '01/01/2022',
    )
    expect(proposal).to_not be_valid

  end
  it "is not valid without a start_date > end_date" do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      value: 2500.00,
      start_date: '02/01/2022',
      end_date: '01/01/2022'
    )
    expect(proposal).to_not be_valid
  end
  it 'is not valid with NaN as value' do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      value: 'invalid',
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
    expect(proposal).to_not be_valid
  end
  it 'is not valid with a value <= 0' do
    proposal = Proposal.new(
      name: 'valid_name',
      description: 'valid description',
      value: -0.1,
      start_date: '01/01/2022',
      end_date: '02/01/2022'
    )
    expect(proposal).to_not be_valid
  end
end