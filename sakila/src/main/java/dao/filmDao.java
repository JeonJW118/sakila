package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class filmDao {
	public Map<String, Object> filmInStockCall(int filmId, int storeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Connection conn = null;
		CallableStatement stmt =
		DBUtil.getConnection();
		
		// select invetory_id...
		List<Integer> list = new ArrayList<>();
		
		// select count*inventory_id( ...
		Integer count = 0;
		
		map.put("list", list);
		map.put("count", count);
		return map;
	}
}
