using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using Bears.DTO;
using Bears.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Repository;

namespace Bears.Controllers
{
	[ApiController]
	[Route("api/bear")]
	[Produces("application/json")]
	public class BearController : ControllerBase
	{
		private readonly ILogger<BearController> _logger;
		private readonly IGenderRepository _genderRepository;
		private readonly IBearRepository _bearRepository;
		private readonly IBearTypeRepository _bearTypeRepository;
		private readonly IMapper _mapper;

		public BearController(ILogger<BearController> logger, IBearRepository bearRepository, IBearTypeRepository bearTypeRepository, IGenderRepository genderRepository)
		{
			_logger = logger;
			_bearRepository = bearRepository;
			_bearTypeRepository = bearTypeRepository;
			_genderRepository = genderRepository;
			_mapper = CreateMapper();

			_logger.LogInformation("BearController initialized.");
		}

		#region API
		[HttpGet]
		public IActionResult GetAllBears()
		{
			try
			{
				var bears = _bearRepository.GetAll();
				var result = _mapper.Map<IEnumerable<BearDto>>(bears);
				
				return Ok(result);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem("Failed to retrieve bears from repository.");
			}
		}

		
		[HttpGet("{bearId}")]
		public IActionResult GetBear(long bearId)
		{
			try
			{
				var bear = _bearRepository.GetByKey(bearId);
				var result = _mapper.Map<BearDto>(bear);

				return Ok(result);

			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem($"Failed to retrieve bear by bearId = {bearId}.");
			}
		}


		[HttpPost("update")]
		public IActionResult Update([FromBody]BearUpdateDto bear)
		{
			try
			{
				var result = _mapper.Map<Bear>(bear);
				_bearRepository.Update(result);

				return Ok(result);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem($"Failed to update bear with bearId= {bear.BearId}.");
			}
		}

		[HttpPost("create")]
		public IActionResult Create([FromBody]BearCreateDto bear)
		{
			try
			{
				var result = _mapper.Map<Bear>(bear);
				var newBear =_bearRepository.Create(result);

				return Ok(newBear);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem($"Failed to update bear with bearId= {bear.Name}.");
			}
		}


		[HttpPost("delete/{bearId}")]
		public IActionResult Delete([FromRoute]long bearId)
		{
			try
			{
				_bearRepository.Delete(bearId);

				return Ok();
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem($"Failed to delete bear with bearId = {bearId}.");
			}
		}
		#endregion

		#region helpers
		private IMapper CreateMapper()
		{
			var bearTypes = _bearTypeRepository.GetAll().ToDictionary(key => key.BearTypeId);
			var genders = _genderRepository.GetAll().ToDictionary(key => key.GenderId);

			var mapper = new MapperConfiguration(cfg =>
			{
				cfg.CreateMap<Bear, BearDto>().AfterMap((src, dest) =>
				{
					dest.BearTypeName = bearTypes[dest.BearTypeId].Name;
					dest.GenderName = genders[dest.GenderId].Name;
				});
				cfg.CreateMap<BearDto, Bear>();
				cfg.CreateMap<BearCreateDto, Bear>();
				cfg.CreateMap<BearUpdateDto, Bear>();

			}).CreateMapper();

			return mapper;
		}
		#endregion
	}
}