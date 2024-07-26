BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "contacts" ALTER COLUMN "profileIMG" DROP NOT NULL;

-- Migration version for proyect
DO $$
BEGIN
    -- Attempt to insert the new record
    BEGIN
        INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
        VALUES ('proyect', '20240726114821798', now());
    EXCEPTION
        WHEN unique_violation THEN
            -- If insert fails due to a conflict, update the existing record
            UPDATE "serverpod_migrations"
            SET "version" = '20240726114821798', "timestamp" = now()
            WHERE "module" = 'proyect';
    END;
END;
$$;

-- Migration version for serverpod
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

-- Migration version for serverpod_auth
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
