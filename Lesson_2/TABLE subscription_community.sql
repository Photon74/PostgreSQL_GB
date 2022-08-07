-- Таблица подписок на сообщества
CREATE TABLE subscription_community (
	user_id INT NOT NULL,
	community_id INT NOT NULL,
	created_at TIMESTAMP,
	PRIMARY KEY (user_id, community_id)
);