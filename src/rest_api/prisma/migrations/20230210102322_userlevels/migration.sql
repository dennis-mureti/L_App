-- AlterTable
ALTER TABLE "broadcasts" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';

-- AlterTable
ALTER TABLE "outbox" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';

-- AlterTable
ALTER TABLE "products" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';

-- AlterTable
ALTER TABLE "sa_persons" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';

-- AlterTable
ALTER TABLE "users" ALTER COLUMN "user_level" SET DEFAULT 'Farmer',
ALTER COLUMN "user_level" SET DATA TYPE TEXT;
