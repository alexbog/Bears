using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using AutoMapper;
using AutoMapper.Data;
using Bears.Contracts;

namespace Repository.Db
{
	/// <summary>
	/// 
	/// </summary>
	/// <typeparam name="T_Value"></typeparam>
	/// <typeparam name="T_Key"></typeparam>
	/// <typeparam name="T_RepoConfig"></typeparam>
	public class DbReadOnlyRepository<T_Value, T_Key, T_RepoConfig> : 
		IReadonlyRepository<T_Value, T_Key> where T_RepoConfig : ReadOnlyRepoConfig where T_Value : class, new()
	{
		protected readonly T_RepoConfig _repoConfig;

		protected readonly IMapper _mapper = new MapperConfiguration(cfg =>
		{
			cfg.AddDataReaderMapping();
			cfg.CreateMap<IDataRecord, T_Value>();
		}).CreateMapper();

		protected DbReadOnlyRepository(T_RepoConfig readOnlyRepoConfig)
		{
			_repoConfig = readOnlyRepoConfig;
		}


		public virtual IEnumerable<T_Value> GetAll()
		{
			return ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToGetAll, null, ResultType.ResultSet);
		}


		public virtual T_Value GetByKey(T_Key key)
		{
			var parameters = new[] { new SqlParameter(_repoConfig.SpKeyParamName, key) };
			return ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToGetByKey, parameters, ResultType.ResultSet).FirstOrDefault();
		}

		protected T_ReturnValue ProcessRequest<T_ReturnValue>(string spName, SqlParameter[] sqlParams, ResultType resultType)
		{
			object result;

			using (var con = new SqlConnection(_repoConfig.ConnectionSettings.ConnectionString))
			{
				con.Open();

				using (var cmd = new SqlCommand
				{
					Connection = con,
					CommandType = CommandType.StoredProcedure,
					CommandText = spName,
					CommandTimeout = _repoConfig.ConnectionSettings.CommandTimeout
				})
				{
					if (sqlParams != null)
					{
						cmd.Parameters.AddRange(sqlParams);
					}

					if (resultType == ResultType.ReturnValue)
					{
						var returnParameter = new SqlParameter()
						{
							ParameterName = "@ReturnVal",
							Direction = ParameterDirection.ReturnValue,
							Value = default(T_ReturnValue)
						};
						cmd.Parameters.Add(returnParameter);
					}

					if (resultType == ResultType.ResultSet)
					{
						using (var rdr = cmd.ExecuteReader())
						{
							result = rdr.HasRows
								? (IEnumerable<T_Value>)_mapper.Map<IDataReader, IEnumerable<T_Value>>(rdr).ToList()
								: new T_Value[] { };
						}
					}

					else
					{
						cmd.ExecuteNonQuery();

						result = resultType == ResultType.ReturnValue
							? cmd.Parameters["@ReturnVal"].Value
							: new T_Value[] { };
					}
				}
			}

			return (T_ReturnValue)result;
		}
	}
}