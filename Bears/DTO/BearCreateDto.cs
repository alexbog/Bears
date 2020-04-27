namespace Bears.DTO
{
	/// <summary>
	/// 
	/// </summary>
	public class BearCreateDto
	{
		public int BearTypeId { get; set; }

		public int GenderId { get; set; }

		public string Name { get; set; }

		public short Age { get; set; }
	}
}