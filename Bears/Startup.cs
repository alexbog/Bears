using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using Repository;
using Repository.Db;
using Repository.Repos;

namespace Bears
{
	public class Startup
	{
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddSwaggerGen(c =>
			{
				c.SwaggerDoc("v1", new OpenApiInfo { Title = "Bears API", Version = "v1" });
			});

			services.AddControllers();

			var connectionSettings = new ConnectionSettings
			{
				ConnectionString = "Data Source=.;Initial Catalog=Bears;Integrated Security=SSPI;Application Name=TReMBIServices;",
				CommandTimeout = 120
			};

			services.AddSingleton<IBearTypeRepository>(new BearTypeRepository(new ReadOnlyRepoConfig{ConnectionSettings = connectionSettings, SpToGetAll = "BearType_SelectAll", SpToGetByKey = "BearType_Select", SpKeyParamName = "bearTypeId"}));
			services.AddSingleton<IGenderRepository>(new GenderRepository(new ReadOnlyRepoConfig { ConnectionSettings = connectionSettings, SpToGetAll = "Gender_SelectAll", SpToGetByKey = "Gender_Select", SpKeyParamName = "genderId"}));
			services.AddSingleton<IBearRepository>(
				new BearRepository(
					new RepoConfig
					{
						ConnectionSettings = connectionSettings, 
						SpToGetAll = "Bear_SelectAll", 
						SpToGetByKey = "Bear_Select", 
						SpKeyParamName = "bearId",
						SpToUpdate = "Bear_Update",
						SpToInsert = "Bear_Insert",
						SpToDelete = "Bear_Delete"
					}));

		}

		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			app.UseSwagger();

			app.UseSwaggerUI(c =>
			{
				c.SwaggerEndpoint("/swagger/v1/swagger.json", "Bears API V1");
			});


			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}

			app.UseDefaultFiles();
			app.UseStaticFiles();

			app.UseRouting();
			
			app.UseEndpoints(endpoints =>
			{
				endpoints.MapControllers();
			});

		}
	}
}
