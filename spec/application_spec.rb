require '_helper'

describe Renote::Cli::Application do

  before :each do
    @app = Renote::Cli::Application.new
  end

  it 'should extend Thor CLI.' do
    expect(@app).to be_a Thor
  end

end