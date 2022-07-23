
DROP TABLE IF EXISTS latest_player_score;
DROP TRIGGER IF EXISTS `tr1`;

CREATE TABLE latest_player_score (
  id VARCHAR(255) NOT NULL,
  tenant_id BIGINT NOT NULL,
  player_id VARCHAR(255) NOT NULL,
  competition_id VARCHAR(255) NOT NULL,
  score BIGINT NOT NULL,
  row_num BIGINT NOT NULL,
  PRIMARY KEY(tenant_id, competition_id, player_id)
);

-- CREATE TRIGGER tr1 AFTER INSERT ON player_score FOR EACH ROW REPLACE INTO latest_player_score (tenant_id, competition_id, player_id) VALUES (NEW.id, NEW.score, NEW.row_num);

CREATE TRIGGER IF NOT EXISTS tr1 AFTER INSERT ON player_score
BEGIN
  INSERT OR REPLACE INTO latest_player_score(id, tenant_id, player_id, competition_id, score, row_num) VALUES(NEW.id, NEW.tenant_id, NEW.player_id, NEW.competition_id, NEW.score, NEW.row_num);
END;
