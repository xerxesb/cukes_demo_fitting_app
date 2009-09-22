configuration = ENV['configuration']

$LOAD_PATH << "../../output/#{configuration}/Cochlear.SimpleFit"
$LOAD_PATH << "../../output/#{configuration}/Cochlear.SimpleFit.Windows"
$LOAD_PATH << "../../output/#{configuration}/Cochlear.SimpleFit.SpecificationHelpers"

require 'Cochlear.Cdi.dll'
require 'Cochlear.SimpleFit.dll'
require 'Cochlear.SimpleFit.SpecificationHelpers.dll'
require 'Cochlear.SimpleFit.Windows.exe'
require 'StructureMap.dll'

require File.expand_path(File.dirname(__FILE__) + '/helpers/CDI.rb')

Cdi = Cochlear::Cdi
Constants = Cochlear::SimpleFit::Constants
Controllers = Cochlear::SimpleFit::Controllers
MapDefaults = Constants::MapDefaults
Models = Cochlear::SimpleFit::Models
ObjectFactory = StructureMap::ObjectFactory
Services = Cochlear::SimpleFit::Services
SpecHelpers = Cochlear::SimpleFit::SpecificationHelpers
Collections = System::Collections

Cochlear::SimpleFit::Windows::Bootstrapper.new.Initialize

ObjectFactory.inject(Cochlear::SimpleFit::Threading::IAsyncInvoker.to_clr_type, SpecHelpers::SyncInvoker.new)