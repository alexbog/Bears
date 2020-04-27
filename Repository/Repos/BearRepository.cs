using System.Data.SqlClient;
using System.Linq;
using Bears.Entities;
using Repository.Db;

namespace Repository.Repos
{
	public class BearRepository : DbRepository<Bear, long, RepoConfig>, IBearRepository
	{
		public BearRepository(RepoConfig config) : base(config)
		{
		}
		protected override SqlParameter[] getParameters(Bear value, bool includeKey)
		{
			var result = new[]
			{
				new SqlParameter("name", value.Name),
				new SqlParameter("bearTypeId", value.BearTypeId),
				new SqlParameter("genderId", value.GenderId),
				new SqlParameter("age", value.Age),
			};

			if (includeKey)
			{
				result = result.Union(new[] {new SqlParameter(_repoConfig.SpKeyParamName, value.BearId)}).ToArray();
			}

			return result;
		}
	}
}