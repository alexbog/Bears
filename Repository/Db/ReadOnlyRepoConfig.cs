namespace Repository.Db
{
	public class ReadOnlyRepoConfig
	{
		/// <summary>
		/// Database connections settings
		/// </summary>
		public ConnectionSettings ConnectionSettings{get; set; }

		/// <summary>
		/// Stored procedure name to get all items.
		/// </summary>
		public string SpToGetAll { get; set; }

		/// <summary>
		/// Stored procedure name to get item by key.
		/// </summary>
		public string SpToGetByKey { get; set; }

		/// <summary>
		/// Name of the key parameter for stored procedure to get item by the key.
		/// </summary>
		public string SpKeyParamName { get; set; }
	}
}