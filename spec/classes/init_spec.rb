require 'spec_helper'
describe 'sogo' do

  context 'with defaults for all parameters' do
    it { should contain_class('sogo') }
  end
end
