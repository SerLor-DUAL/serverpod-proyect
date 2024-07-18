BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "contacts" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "phoneNumber" text NOT NULL,
    "userID" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "primary" ON "contacts" USING btree ("userID", "phoneNumber");

--
-- ACTION ALTER TABLE
--
DROP INDEX "user_id_idx";
CREATE INDEX "user_id_idx" ON "tasks" USING btree ("userID");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "contacts"
    ADD CONSTRAINT "contacts_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "users_registry"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

/*
--
-- MIGRATION VERSION FOR proyect
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('proyect', '20240718081201511', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240718081201511', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

*/

--
-- MIGRATION VERSION FOR proyect
--
WITH upsert AS (
    UPDATE "serverpod_migrations"
    SET "version" = '20240718081201511', "timestamp" = now()
    WHERE "module" = 'proyect'
    RETURNING *
)
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
SELECT 'proyect', '20240718081201511', now()
WHERE NOT EXISTS (SELECT 1 FROM upsert);

--
-- MIGRATION VERSION FOR serverpod
--
WITH upsert AS (
    UPDATE "serverpod_migrations"
    SET "version" = '20240516151843329', "timestamp" = now()
    WHERE "module" = 'serverpod'
    RETURNING *
)
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
SELECT 'serverpod', '20240516151843329', now()
WHERE NOT EXISTS (SELECT 1 FROM upsert);

COMMIT;
