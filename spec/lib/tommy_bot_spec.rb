require 'spec_helper'

describe TommyBot do
  it 'has a version number' do
    expect(TommyBot::VERSION).not_to be nil
  end

  it 'api.test' do
    expect(TommyBot.new).to be_ok
  end
end
