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

		protected abstract SqlParameter[] getParameters(T_Value value, bool includeKey);
	}
}