BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "contacts" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "contacts" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "phoneNumber" text NOT NULL,
    "profileIMG" text NOT NULL,
    "userID" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "primary" ON "contacts" USING btree ("userID", "phoneNumber");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "contacts"
    ADD CONSTRAINT "contacts_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "users_registry"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


-- Migration for proyect
DO $$
BEGIN
    -- Attempt to insert the new record
    BEGIN
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('proyect', '20240726102657647', now());
    EXCEPTION
        WHEN unique_violation THEN
            -- If insert fails due to a conflict, update the existing record
            UPDATE "serverpod_migrations"
            SET "version" = '20240726102657647', "timestamp" = now()
            WHERE "module" = 'proyect';
    END;
END;
$$;

-- Migration for serverpod
DO $$
BEGIN
    -- Attempt to insert the new record
    BEGIN
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('serverpod', '20240516151843329', now());
    EXCEPTION
        WHEN unique_violation THEN
            -- If insert fails due to a conflict, update the existing record
            UPDATE "serverpod_migrations"
            SET "version" = '20240516151843329', "timestamp" = now()
            WHERE "module" = 'serverpod';
    END;
END;
$$;

-- Migration for serverpod_auth
DO $$
BEGIN
    -- Attempt to insert the new record
    BEGIN
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('serverpod_auth', '20240520102713718', now());
    EXCEPTION
        WHEN unique_violation THEN
            -- If insert fails due to a conflict, update the existing record
            UPDATE "serverpod_migrations"
            SET "version" = '20240520102713718', "timestamp" = now()
            WHERE "module" = 'serverpod_auth';
    END;
END;
$$;

COMMIT;
