namespace Bears.Contracts
{
	/// <summary>
	/// 
	/// </summary>
	/// <typeparam name="T_Value"></typeparam>
	/// <typeparam name="T_Key"></typeparam>
	public interface IRepository<T_Value, in T_Key> : IReadonlyRepository<T_Value, T_Key> where T_Value : class, new()
	{
		T_Value Create(T_Value value);

		void Update(T_Value value);

		void Delete(T_Key key);
	}
}
