require 'd:\\source\\cochlear\\simplefit\\source\\behaviour\\specs\\GlobalInclude.rb'
require 'spec'

class CdiService
    include Services::ICdiService
  
    attr_reader :write_program_was_called
      
    def write_program
        @write_program_was_called = true;
    end    
end

Given /^a new program$/ do
  #pending
end

When /^I write the program$/ do
  
    @cdi_service = CdiService.new
    
    write_program_service = Services::WriteProgramService.new @cdi_service
    write_program_service.write_program
    
end

Then /^it should be in slot 1$/ do
    @cdi_service.write_program_was_called.should be_true
end