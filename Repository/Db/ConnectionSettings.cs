namespace Repository.Db
{
	/// <summary>
	/// 
	/// </summary>
	public class ConnectionSettings
	{
		/// <summary>
		/// Database connection string.
		/// </summary>
		public string ConnectionString { get; set; }

		/// <summary>
		/// Command time out.
		/// </summary>
		public int CommandTimeout { get; set; }
	}
}