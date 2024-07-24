BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "users_registry" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users_registry" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "userPassword" text NOT NULL,
    "options" bigint NOT NULL,
    "userInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_name_idx" ON "users_registry" USING btree ("userName");
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "users_registry" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "users_registry"
    ADD CONSTRAINT "users_registry_fk_0"
    FOREIGN KEY("options")
    REFERENCES "password_options"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE ONLY "users_registry"
    ADD CONSTRAINT "users_registry_fk_1"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR proyect
--
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM "serverpod_migrations" WHERE "module" = 'proyect') THEN
        UPDATE "serverpod_migrations"
        SET "version" = '20240724085909657', "timestamp" = now()
        WHERE "module" = 'proyect';
    ELSE
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('proyect', '20240724085909657', now());
    END IF;
END
$$;

--
-- MIGRATION VERSION FOR serverpod
--
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM "serverpod_migrations" WHERE "module" = 'serverpod') THEN
        UPDATE "serverpod_migrations"
        SET "version" = '20240516151843329', "timestamp" = now()
        WHERE "module" = 'serverpod';
    ELSE
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('serverpod', '20240516151843329', now());
    END IF;
END
$$;

--
-- MIGRATION VERSION FOR serverpod_auth
--
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM "serverpod_migrations" WHERE "module" = 'serverpod_auth') THEN
        UPDATE "serverpod_migrations"
        SET "version" = '20240520102713718', "timestamp" = now()
        WHERE "module" = 'serverpod_auth';
    ELSE
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('serverpod_auth', '20240520102713718', now());
    END IF;
END
$$;

COMMIT;
