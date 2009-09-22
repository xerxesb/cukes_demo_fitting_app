using System;

namespace Cochlear.SimpleFit.Services
{
    public class WriteProgramService
    {
        private readonly ICdiService _cdiService;

        public WriteProgramService(ICdiService cdiService)
        {
            _cdiService = cdiService;
        }

        public void WriteProgram()
        {
            _cdiService.WriteProgram();
        }
    }
}