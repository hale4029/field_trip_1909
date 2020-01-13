require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age }
  end
  describe 'relationships' do
    xit {should belong_to :airline}
  end
end
