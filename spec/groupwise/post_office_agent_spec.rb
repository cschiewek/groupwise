require 'spec_helper'
require 'groupwise'
include Groupwise

describe PostOfficeAgent do
  before do
    @config = RSpec.configuration.groupwise_config['post_office_agent']
    @poa = PostOfficeAgent.new(
      @config['endpoint'], @config['username'], @config['app_name'], @config['app_key']
    )
  end

  it 'should have an endpoint' do
    expect(@poa.endpoint).to eq(@config['endpoint'])
  end

  it 'should detect the version' do
    expect(@poa.version).to eq(@config['version'])
  end

  it 'should set the wsdl' do
    expect(@poa.wsdl).to eq('./contrib/novell/GW1201/groupwise.wsdl')
  end

  it 'should have a Savon client' do
    expect(@poa.client).to be_a(Savon::Client)
  end

  it 'should set the session' do
    expect(@poa.instance_variable_get('@session')).to_not be_nil
  end

  it 'should allow you to logout' do
    expect(@poa.logout[:status][:code]).to eq('0')
  end

  it 'should be return free busy information' do
    email_addresses = @config['users']
    expect(@poa.free_busy(email_addresses)).to_not be_nil
  end
end
