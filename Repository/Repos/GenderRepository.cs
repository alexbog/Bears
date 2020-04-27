using Bears.Entities;
using Repository.Db;

namespace Repository.Repos
{
	public class GenderRepository : DbReadOnlyRepository<Gender, int, ReadOnlyRepoConfig>, IGenderRepository
	{
		public GenderRepository(ReadOnlyRepoConfig config) : base(config)
		{
		}
	}
}