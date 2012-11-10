require 'spec_helper'

describe HostSystem do
  subject { HostSystem } # Use the Class instead of an instance
  it { should == System }
end

describe System do
  subject { System } # Use the Class instead of an instance
  
  describe '.os' do
    it 'should delegate to System::OS.name' do
      System::OS.should_receive(:name).and_return(:mock_response)
      
      System.os.should == :mock_response
    end
  end
  
  describe '.java?' do
    it 'should delegate to System::Ruby.java?' do
      System::Ruby.should_receive(:java?).and_return(:mock_response)
      
      System.java?.should == :mock_response
    end
  end
  
  describe '.jruby?' do
    it 'should delegate to System::Ruby.jruby?' do
      System::Ruby.should_receive(:jruby?).and_return(:mock_response)
      
      System.jruby?.should == :mock_response
    end
  end
  
end