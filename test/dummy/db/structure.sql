CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "timezone_detection_ip_timezones" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "ip_in_longint" INT UNSIGNED DEFAULT 0, "utc_offset" integer);
CREATE INDEX "index_timezone_detection_ip_timezones_on_ip_in_longint" ON "timezone_detection_ip_timezones" ("ip_in_longint");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120808173854');