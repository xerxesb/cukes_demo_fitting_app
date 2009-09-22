using Cochlear.SimpleFit.Services;
using NUnit.Framework;
using Rhino.Mocks;

namespace Cochlear.SimpleFit.UnitTests.Services.WriteProgramServiceFixtures
{
    public class WriteProgramServiceFixture
    {
        [TestFixture]
        public class WhenWritingProgram
        {
            private ICdiService _mockCdiService;

            [SetUp]
            public void SetUp()
            {
                _mockCdiService = MockRepository.GenerateMock<ICdiService>();

                var writeProgramService = new WriteProgramService(_mockCdiService);
                writeProgramService.WriteProgram();
            }

            [Test]
            public void ShouldCallWriteProgramOnCdiService()
            {
                _mockCdiService.AssertWasCalled(x => x.WriteProgram());
            }
        }
    }
}