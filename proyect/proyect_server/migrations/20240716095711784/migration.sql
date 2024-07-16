BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "password_generator" (
    "id" bigserial PRIMARY KEY,
    "optionsId" bigint NOT NULL,
    "password" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "password_options" (
    "id" bigserial PRIMARY KEY,
    "passwordLengthOption" bigint,
    "upperOption" boolean,
    "numberOption" boolean,
    "specialOption" boolean,
    "automatedPassword" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tasks" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text,
    "deadLine" timestamp without time zone NOT NULL,
    "complete" boolean NOT NULL,
    "userID" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_id_idx" ON "tasks" USING btree ("userID");
CREATE INDEX "title_idx" ON "tasks" USING btree ("title");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users_registry" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "userPasswordId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_name_idx" ON "users_registry" USING btree ("userName");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "password_generator"
    ADD CONSTRAINT "password_generator_fk_0"
    FOREIGN KEY("optionsId")
    REFERENCES "password_options"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tasks"
    ADD CONSTRAINT "tasks_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "users_registry"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "users_registry"
    ADD CONSTRAINT "users_registry_fk_0"
    FOREIGN KEY("userPasswordId")
    REFERENCES "password_generator"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR proyect
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('proyect', '20240716095711784', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240716095711784', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
