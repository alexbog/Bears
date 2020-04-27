using System.Collections.Generic;

namespace Bears.Contracts
{
	/// <summary>
	/// 
	/// </summary>
	/// <typeparam name="T_Value"></typeparam>
	/// <typeparam name="T_Key"></typeparam>
	public interface IReadonlyRepository<out T_Value, in T_Key> where T_Value : class, new()
	{
		IEnumerable<T_Value> GetAll();

		T_Value GetByKey(T_Key key);
	}
}