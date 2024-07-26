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


--
-- MIGRATION VERSION FOR proyect
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('proyect', '20240726102657647', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240726102657647', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
