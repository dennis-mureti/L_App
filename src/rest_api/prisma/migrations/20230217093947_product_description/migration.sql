/*
  Warnings:

  - Added the required column `product_description` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "broadcasts" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';

-- AlterTable
ALTER TABLE "outbox" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';

-- AlterTable
ALTER TABLE "products" ADD COLUMN     "product_description" VARCHAR(200) NOT NULL,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "updated_at" SET DATA TYPE TIMESTAMP(3);

-- AlterTable
ALTER TABLE "sa_persons" ALTER COLUMN "updated_at" SET DEFAULT '2000-10-10 00:00:00';
