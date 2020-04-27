namespace Repository.Db
{
	public class RepoConfig : ReadOnlyRepoConfig
	{
		/// <summary>
		/// Stored procedure name to insert item.
		/// </summary>
		public string SpToInsert { get; set; }

		/// <summary>
		/// Stored procedure name to update item.
		/// </summary>
		public string SpToUpdate { get; set; }

		/// <summary>
		/// Stored procedure name to delete item.
		/// </summary>
		public string SpToDelete { get; set; }
	}
}