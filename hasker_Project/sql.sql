BEGIN;
--
-- Create model CustomUser
--
CREATE TABLE "accounts_customuser" ("id" bigserial NOT NULL PRIMARY KEY, "password" varchar(128) NOT NULL, "last_login" timestamp with time zone NULL, "is_superuser" boolean NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" boolean NOT NULL, "is_active" boolean NOT NULL, "date_joined" timestamp with time zone NOT NULL, "avatar" varchar(100) NULL);
CREATE TABLE "accounts_customuser_groups" ("id" bigserial NOT NULL PRIMARY KEY, "customuser_id" bigint NOT NULL, "group_id" integer NOT NULL);
CREATE TABLE "accounts_customuser_user_permissions" ("id" bigserial NOT NULL PRIMARY KEY, "customuser_id" bigint NOT NULL, "permission_id" integer NOT NULL);
CREATE INDEX "accounts_customuser_username_722f3555_like" ON "accounts_customuser" ("username" varchar_pattern_ops);
ALTER TABLE "accounts_customuser_groups" ADD CONSTRAINT "accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq" UNIQUE ("customuser_id", "group_id");
ALTER TABLE "accounts_customuser_groups" ADD CONSTRAINT "accounts_customuser__customuser_id_bc55088e_fk_accounts_" FOREIGN KEY ("customuser_id") REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "accounts_customuser_groups" ADD CONSTRAINT "accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "accounts_customuser_groups_customuser_id_bc55088e" ON "accounts_customuser_groups" ("customuser_id");
CREATE INDEX "accounts_customuser_groups_group_id_86ba5f9e" ON "accounts_customuser_groups" ("group_id");
ALTER TABLE "accounts_customuser_user_permissions" ADD CONSTRAINT "accounts_customuser_user_customuser_id_permission_9632a709_uniq" UNIQUE ("customuser_id", "permission_id");
ALTER TABLE "accounts_customuser_user_permissions" ADD CONSTRAINT "accounts_customuser__customuser_id_0deaefae_fk_accounts_" FOREIGN KEY ("customuser_id") REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "accounts_customuser_user_permissions" ADD CONSTRAINT "accounts_customuser__permission_id_aea3d0e5_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "accounts_customuser_user_permissions_customuser_id_0deaefae" ON "accounts_customuser_user_permissions" ("customuser_id");
CREATE INDEX "accounts_customuser_user_permissions_permission_id_aea3d0e5" ON "accounts_customuser_user_permissions" ("permission_id");
COMMIT;
