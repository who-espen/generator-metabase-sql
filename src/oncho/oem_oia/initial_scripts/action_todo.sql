
/**
 * The table that will contain the list of action
 */
CREATE TABLE IF NOT EXISTS matabase_oncho_oem_action_todo_202004(
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  actor TEXT NOT NULL,
  status TEXT NOT NULL,
  due_date DATE NULL,
  surver_detail VARCHAR(50) NOT NULL
  );
