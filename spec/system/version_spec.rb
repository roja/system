require 'spec_helper'

describe System do
  subject { System::VERSION }
  
  it { should == Pathname.new(__FILE__).join('..', '..', '..', 'VERSION').read.strip }
end

