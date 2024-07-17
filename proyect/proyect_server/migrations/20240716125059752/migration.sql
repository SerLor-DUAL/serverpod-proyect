BEGIN;


--
-- MIGRATION VERSION FOR proyect
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('proyect', '20240716125059752', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240716125059752', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
