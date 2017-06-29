-- +micrate Up
CREATE TABLE rooms (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  slug VARCHAR(255),
  session_id VARCHAR(255),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- +micrate Down
DROP TABLE IF EXISTS rooms;
