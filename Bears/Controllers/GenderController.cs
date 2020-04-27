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
	[Route("api/gender")]
	public class GenderController : ControllerBase
	{
		private readonly ILogger<GenderController> _logger;
		private readonly IGenderRepository _genderRepository;
		private readonly IMapper _mapper = new MapperConfiguration(cfg =>
		{
			cfg.CreateMap<Gender, GenderDto>();
		}).CreateMapper();

		public GenderController(ILogger<GenderController> logger, IGenderRepository genderRepository)
		{
			_logger = logger;
			_genderRepository = genderRepository;
			_logger.LogInformation("GenderController initialized.");
		}

		[HttpGet]
		public IActionResult GetAllGenders()
		{
			try
			{
				var genders = _genderRepository.GetAll();
				var result = _mapper.Map<IEnumerable<GenderDto>>(genders);

				return Ok(result);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem("Failed to retrieve genders from repository.");
			}

		}

		[HttpGet("{genderId}")]
		public IActionResult GetGender(int genderId)
		{
			try
			{
				var gender = _genderRepository.GetByKey(genderId);
				var result = _mapper.Map<GenderDto>(gender);

				return Ok(result);
			}
			catch (Exception ex)
			{
				_logger.LogError(ex.ToString());
				return Problem($"Failed to retrieve gender by genderId = {genderId}.");
			}

		}
	}
}