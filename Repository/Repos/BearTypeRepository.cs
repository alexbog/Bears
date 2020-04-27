using System.Collections.Generic;
using Bears.Entities;
using Repository.Db;

namespace Repository.Repos
{
	public class BearTypeRepository : DbReadOnlyRepository<BearType, int, ReadOnlyRepoConfig>, IBearTypeRepository
	{
		public BearTypeRepository(ReadOnlyRepoConfig config) : base(config)
		{
		}
	}
}