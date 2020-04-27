namespace Bears.DTO
{
	public class BearUpdateDto
	{
		public long BearId { get; set; }

		public int BearTypeId { get; set; }

		public int GenderId { get; set; }

		public string Name { get; set; }

		public short Age { get; set; }
	}
}