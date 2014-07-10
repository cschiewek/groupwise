require 'spec_helper'

describe Groupwise do 
  it 'should be defined' do
    expect(defined?(Groupwise)).to eq('constant')
  end

  describe '.wsdl_version' do
    it 'should return the closest matching version' do
      expect(Groupwise.wsdl_version('12.0.2')).to eq('1201')
    end
  end
end
