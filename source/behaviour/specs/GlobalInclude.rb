configuration = ENV['configuration']

$LOAD_PATH << "../../output/#{configuration}/Cochlear.SimpleFit"
$LOAD_PATH << "../../output/#{configuration}/Cochlear.SimpleFit.Windows"
$LOAD_PATH << "../../output/#{configuration}/Cochlear.SimpleFit.SpecificationHelpers"

require 'Cochlear.Cdi.dll'
require 'Cochlear.SimpleFit.dll'
require 'Cochlear.SimpleFit.SpecificationHelpers.dll'
require 'Cochlear.SimpleFit.Windows.exe'
require 'StructureMap.dll'

Services = Cochlear::SimpleFit::Services
