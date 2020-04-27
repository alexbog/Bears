using System;
using System.Collections.Generic;
using AutoMapper;
using Bears.DTO;
using Bears.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Repository;

namespace Bears.Controllers
{
	[ApiController]
	[Route("api/beartype")]
	public class BearTypeController : ControllerBase
	{
		private readonly ILogger<BearTypeController> _logger;
		private readonly IBearTypeRepository _bearTypeRepository;
		private readonly IMapper _mapper = new MapperConfiguration(cfg =>
		{
			cfg.CreateMap<BearType, BearTypeDto>().AfterMap((src, dest) =>
			{
				dest.ImageUrl = $"images/BearType/{dest.BearTypeId}.jpg";
			});
		}).CreateMapper();

		public BearTypeController(ILogger<BearTypeController> logger, IBearTypeRepository bearTypeRepository)
		{
			_logger = logger;
			_bearTypeRepository = bearTypeRepository;
			_logger.LogInformation("BearTypeController initialize.");
		}


		[HttpGet]
		public IActionResult GetAllBearTypes()
		{
			try
			{
				var bearTypes = _bearTypeRepository.GetAll();
				var result = _mapper.Map<IEnumerable<BearTypeDto>>(bearTypes);

				return Ok(result);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem("Failed to retrieve bear types from repository.");
			}
		}

		[HttpGet("{bearTypeId}")]
		public IActionResult GetBearType(int bearTypeId)
		{
			try
			{
				var bearType = _bearTypeRepository.GetByKey(bearTypeId);
				var result = _mapper.Map<BearTypeDto>(bearType);

				return Ok(result);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem($"Failed to retrieve bear type by BearTypeId = {bearTypeId}.");
			}
		}
	
	}
}
