using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Variacao.Ativo.Domain.Entities;
using Variacao.Ativo.Domain.Interfaces;

namespace Variacao.Ativo.Application.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AtivoController : ControllerBase
    {
        private readonly ILogger<AtivoController> _logger;
        private readonly IService<ConsultAtivo> _service;

        public AtivoController(ILogger<AtivoController> logger, IService<ConsultAtivo> service)
        {
            _logger = logger;
            _service = service;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var consultAtivo = _service.Get();

            return Ok(consultAtivo);
        }

    }
}
