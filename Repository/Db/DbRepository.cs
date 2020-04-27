using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Bears.Contracts;

namespace Repository.Db
{
	/// <summary>
	/// 
	/// </summary>
	/// <typeparam name="T_Value"></typeparam>
	/// <typeparam name="T_Key"></typeparam>
	/// <typeparam name="T_RepoConfig"></typeparam>
	public abstract class DbRepository<T_Value, T_Key, T_RepoConfig> :
		DbReadOnlyRepository<T_Value, T_Key, T_RepoConfig>, 
		IRepository<T_Value, T_Key> where T_RepoConfig : RepoConfig where T_Value : class, new()
	{
		protected DbRepository(T_RepoConfig repoConfig): base(repoConfig)
		{
		}
		

		//private T_ReturnValue ProcessRequest<T_ReturnValue>(string spName, SqlParameter[] sqlParams, ResultType resultType)
		//{
		//	object result;

		//	using (var con = new SqlConnection(_repoConfig.ConnectionString))
		//	{
		//		con.Open();

		//		using (var cmd = new SqlCommand
		//		{
		//			Connection = con, 
		//			CommandType = CommandType.StoredProcedure, 
		//			CommandText = spName, 
		//			CommandTimeout = _repoConfig.CommandTimeout
		//		})
		//		{
		//			if (sqlParams != null)
		//			{
		//				cmd.Parameters.AddRange(sqlParams);
		//			}

		//			if (resultType == ResultType.ReturnValue)
		//			{
		//				var returnParameter = new SqlParameter()
		//				{
		//					ParameterName = "@ReturnVal",
		//					Direction = ParameterDirection.ReturnValue
		//				};
		//				cmd.Parameters.Add(returnParameter);
		//			}

		//			if (resultType == ResultType.ResultSet)
		//			{
		//				using (var rdr = cmd.ExecuteReader())
		//				{
		//					result = rdr.HasRows
		//						? (IEnumerable<T_Value>) _mapper.Map<IDataReader, IEnumerable<T_Value>>(rdr).ToList()
		//						: new T_Value[] { };
		//				}
		//			}

		//			else
		//			{
		//				cmd.ExecuteNonQuery();

		//				if (resultType == ResultType.ReturnValue)
		//				{
		//					result = cmd.Parameters["@ReturnVal"];
		//				}
		//				else
		//				{
		//					result = new T_Value[] { };
		//				}
		//			}
		//		}
		//	}

		//	return (T_ReturnValue) result;
		//}

		public T_Value Create(T_Value value)
		{
			var parameters = getParameters(value, false);
			var result = ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToInsert, parameters, ResultType.ResultSet).FirstOrDefault();

			return result;
		}

		public void Update(T_Value value)
		{
			var parameters = getParameters(value, true);
			ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToUpdate, parameters, ResultType.NoResult);
		}

		public void Delete(T_Key key)
		{
			var parameters = new []{new SqlParameter(_repoConfig.SpKeyParamName, key)};
			ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToDelete, parameters, ResultType.NoResult);
		}

		//public override IEnumerable<T_Value> GetAll()
		//{
		//	return ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToGetAll, null, ResultType.ResultSet);
		//}


		//public override T_Value GetByKey(T_Key key)
		//{
		//	var parameters = new[] { new SqlParameter(_repoConfig.SpKeyParamName, key) };
		//	return ProcessRequest<IEnumerable<T_Value>>(_repoConfig.SpToGetByKey, parameters, ResultType.ResultSet).FirstOrDefault();
		//}

		abstract protected SqlParameter[] getParameters(T_Value value, bool includeKey);
	}
}