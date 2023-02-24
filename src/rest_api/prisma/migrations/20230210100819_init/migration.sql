-- CreateEnum
CREATE TYPE "county_status" AS ENUM ('Active', 'In Active');

-- CreateEnum
CREATE TYPE "corps_vet_reg_status" AS ENUM ('Active', 'Inactive');

-- CreateEnum
CREATE TYPE "farmer_leads_status" AS ENUM ('Inactive', 'Active');

-- CreateEnum
CREATE TYPE "persons_status" AS ENUM ('Active', 'Inactive');

-- CreateTable
CREATE TABLE "broadcasts" (
    "broadcast_id" TEXT NOT NULL,
    "broadcast_name" VARCHAR(25) NOT NULL,
    "broadcast_content" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT '2000-10-10 00:00:00',
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,

    CONSTRAINT "broadcasts_pkey" PRIMARY KEY ("broadcast_id")
);

-- CreateTable
CREATE TABLE "corp_vet_transfer" (
    "transfer_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "registered_farmers" INTEGER NOT NULL,
    "subcounty_from" TEXT NOT NULL,
    "subcounty_to" TEXT NOT NULL,
    "transfer_reason" VARCHAR(100) NOT NULL,
    "transfer_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "corp_vet_transfer_pkey" PRIMARY KEY ("transfer_id")
);

-- CreateTable
CREATE TABLE "corps" (
    "corp_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "is_vet" VARCHAR(3) DEFAULT 'No',
    "vet_reg_number" VARCHAR(20),
    "vet_reg_status" "corps_vet_reg_status" DEFAULT 'Inactive',
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "created_by" TEXT,
    "updated_by" TEXT,

    CONSTRAINT "corps_pkey" PRIMARY KEY ("corp_id")
);

-- CreateTable
CREATE TABLE "county" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "code" BYTEA,
    "status" "county_status",
    "date_added" TIMESTAMP(3) NOT NULL,
    "time_stamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "county_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "farmer_corp" (
    "farmer_corp_id" TEXT NOT NULL,
    "farmer_id" TEXT NOT NULL,
    "corp_id" TEXT,
    "vet_id" TEXT,

    CONSTRAINT "farmer_corp_pkey" PRIMARY KEY ("farmer_corp_id")
);

-- CreateTable
CREATE TABLE "farmer_leads" (
    "id" TEXT NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "id_number" VARCHAR(50) NOT NULL,
    "phone_no" VARCHAR(50) NOT NULL,
    "county" VARCHAR(60) NOT NULL,
    "location" VARCHAR(60) NOT NULL,
    "status" "farmer_leads_status" NOT NULL DEFAULT 'Active',
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "farmer_leads_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "farmer_transfer" (
    "transfer_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "registered_by" TEXT NOT NULL,
    "transfer_reason" VARCHAR(255) NOT NULL,
    "transfer_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "farmer_transfer_pkey" PRIMARY KEY ("transfer_id")
);

-- CreateTable
CREATE TABLE "farmers" (
    "farmer_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "location" VARCHAR(50) NOT NULL,
    "no_of_livestock" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,

    CONSTRAINT "farmers_pkey" PRIMARY KEY ("farmer_id")
);

-- CreateTable
CREATE TABLE "farmorder_level" (
    "level_id" TEXT NOT NULL,
    "phone_no" VARCHAR(25) NOT NULL,
    "person_id" TEXT,
    "level" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "farmorder_level_pkey" PRIMARY KEY ("level_id")
);

-- CreateTable
CREATE TABLE "inbox" (
    "inbox_id" TEXT NOT NULL,
    "source" VARCHAR(255) NOT NULL,
    "destination" VARCHAR(255) NOT NULL,
    "content" VARCHAR(255) NOT NULL,
    "processed" VARCHAR(5) NOT NULL DEFAULT 'No',
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "LinkId" VARCHAR(255),
    "reference" VARCHAR(255),
    "receivedtime" VARCHAR(50),

    CONSTRAINT "inbox_pkey" PRIMARY KEY ("inbox_id")
);

-- CreateTable
CREATE TABLE "information_center" (
    "infor_id" TEXT NOT NULL,
    "infor_name" VARCHAR(200) NOT NULL,
    "infor_link" VARCHAR(250) NOT NULL,
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "validity" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "information_center_pkey" PRIMARY KEY ("infor_id")
);

-- CreateTable
CREATE TABLE "level" (
    "level_id" TEXT NOT NULL,
    "level_name" VARCHAR(25) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "level_pkey" PRIMARY KEY ("level_id")
);

-- CreateTable
CREATE TABLE "migrations" (
    "id" TEXT NOT NULL,
    "migration" VARCHAR(255) NOT NULL,
    "batch" INTEGER NOT NULL,

    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mpesa_requests" (
    "id" TEXT NOT NULL,
    "ussdSessionId" CHAR(255) NOT NULL,
    "msisdn" VARCHAR(13) NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "rateId" INTEGER NOT NULL,
    "subcountyId" TEXT,
    "paymentStatus" INTEGER NOT NULL DEFAULT 201,
    "accountReference" VARCHAR(30),
    "transactionDescription" VARCHAR(50),
    "mpesaReceiptNumber" VARCHAR(30),
    "dateCreated" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "transactionDate" TIMESTAMP(0),
    "limaProStatus" INTEGER NOT NULL DEFAULT 101,
    "datePushedToLimaPro" TIMESTAMP(0),

    CONSTRAINT "mpesa_requests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_details" (
    "order_details_id" TEXT NOT NULL,
    "order_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "quantity_ordered" INTEGER NOT NULL,
    "quantity_delivered" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,
    "detail_status" INTEGER,
    "comments" TEXT,

    CONSTRAINT "order_details_pkey" PRIMARY KEY ("order_details_id")
);

-- CreateTable
CREATE TABLE "orders" (
    "order_id" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "order_to" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,
    "no_order_details" INTEGER,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_id")
);

-- CreateTable
CREATE TABLE "outbox" (
    "outbox_id" TEXT NOT NULL,
    "destination" VARCHAR(15) NOT NULL,
    "message" TEXT NOT NULL,
    "source" VARCHAR(15) NOT NULL,
    "status" VARCHAR(25) NOT NULL DEFAULT 'Not Processed',
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT '2000-10-10 00:00:00',

    CONSTRAINT "outbox_pkey" PRIMARY KEY ("outbox_id")
);

-- CreateTable
CREATE TABLE "persons" (
    "person_id" TEXT NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "id_number" VARCHAR(20) NOT NULL,
    "gender" VARCHAR(20) NOT NULL,
    "phone_no" VARCHAR(15) NOT NULL,
    "county_id" TEXT NOT NULL,
    "sub_county_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "created_by" TEXT,
    "updated_by" TEXT,
    "status" "persons_status" NOT NULL DEFAULT 'Active',
    "level" INTEGER,
    "county" TEXT,

    CONSTRAINT "persons_pkey" PRIMARY KEY ("person_id")
);

-- CreateTable
CREATE TABLE "product_stocks" (
    "id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "buying_price" INTEGER NOT NULL,
    "selling_price" INTEGER NOT NULL,
    "balance" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "created_by" TEXT,
    "updated_by" TEXT,

    CONSTRAINT "product_stocks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "product_id" TEXT NOT NULL,
    "product_name" VARCHAR(50) NOT NULL,
    "product_code" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT '2000-10-10 00:00:00',
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,
    "rate" INTEGER,
    "product_serial_code" VARCHAR(50) DEFAULT '101',

    CONSTRAINT "products_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "sa_persons" (
    "sa_person_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT '2000-10-10 00:00:00',
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,

    CONSTRAINT "sa_persons_pkey" PRIMARY KEY ("sa_person_id")
);

-- CreateTable
CREATE TABLE "sales_agent_products" (
    "id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "sales_agent_id" TEXT NOT NULL,
    "buying_price" INTEGER NOT NULL DEFAULT 0,
    "selling_price" INTEGER NOT NULL,
    "available_balance" INTEGER DEFAULT 0,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" DATE NOT NULL,
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,

    CONSTRAINT "sales_agent_products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales_agent_stock" (
    "id" TEXT NOT NULL,
    "sales_agent_product" TEXT NOT NULL,
    "sales_agent_person_id" TEXT NOT NULL,

    CONSTRAINT "sales_agent_stock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sas" (
    "sa_id" TEXT NOT NULL,
    "sa_name" VARCHAR(255),
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT,
    "updated_by" TEXT,

    CONSTRAINT "sas_pkey" PRIMARY KEY ("sa_id")
);

-- CreateTable
CREATE TABLE "stocks" (
    "stock_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "stock_code" VARCHAR(50) NOT NULL,
    "stock_in" VARCHAR(50) NOT NULL,
    "stock_out" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL,
    "updated_by" TEXT NOT NULL,
    "remember_token" VARCHAR(255),

    CONSTRAINT "stocks_pkey" PRIMARY KEY ("stock_id")
);

-- CreateTable
CREATE TABLE "sub_county" (
    "name" VARCHAR(255) NOT NULL,
    "time_stamp" TIMESTAMP(3),
    "status" VARCHAR(255),
    "county_id" TEXT,
    "id" TEXT NOT NULL,

    CONSTRAINT "sub_county_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier_persons" (
    "supplier_person_id" TEXT NOT NULL,
    "supplier_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "supplier_name" VARCHAR(255),
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(0),
    "created_by" TEXT,
    "updated_by" TEXT,

    CONSTRAINT "supplier_persons_pkey" PRIMARY KEY ("supplier_person_id")
);

-- CreateTable
CREATE TABLE "suppliers" (
    "supplier_id" TEXT NOT NULL,
    "supplier_name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT,
    "updated_by" TEXT,

    CONSTRAINT "suppliers_pkey" PRIMARY KEY ("supplier_id")
);

-- CreateTable
CREATE TABLE "user_level" (
    "user_level_id" TEXT NOT NULL,
    "user_level_name" VARCHAR(255),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "user_level_pkey" PRIMARY KEY ("user_level_id")
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "user_level" INTEGER DEFAULT 5,
    "status" VARCHAR(255) NOT NULL DEFAULT 'Active',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "updated_by" TEXT,
    "remember_token" VARCHAR(255),

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateIndex
CREATE INDEX "corp_vet_transfer_person_id_idx" ON "corp_vet_transfer"("person_id");

-- CreateIndex
CREATE INDEX "corp_vet_transfer_subcounty_from_idx" ON "corp_vet_transfer"("subcounty_from");

-- CreateIndex
CREATE INDEX "corp_vet_transfer_subcounty_to_idx" ON "corp_vet_transfer"("subcounty_to");

-- CreateIndex
CREATE INDEX "corps_person_id_idx" ON "corps"("person_id");

-- CreateIndex
CREATE INDEX "county_code_idx" ON "county"("code");

-- CreateIndex
CREATE INDEX "county_name_idx" ON "county"("name");

-- CreateIndex
CREATE INDEX "farmer_corp_corp_id_idx" ON "farmer_corp"("corp_id");

-- CreateIndex
CREATE INDEX "farmer_corp_farmer_id_idx" ON "farmer_corp"("farmer_id");

-- CreateIndex
CREATE INDEX "farmer_corp_vet_id_idx" ON "farmer_corp"("vet_id");

-- CreateIndex
CREATE INDEX "farmer_transfer_registered_by_idx" ON "farmer_transfer"("registered_by");

-- CreateIndex
CREATE INDEX "farmer_transfer_person_id_idx" ON "farmer_transfer"("person_id");

-- CreateIndex
CREATE INDEX "farmers_person_id_idx" ON "farmers"("person_id");

-- CreateIndex
CREATE INDEX "inbox_source_idx" ON "inbox"("source");

-- CreateIndex
CREATE INDEX "information_center_created_by_idx" ON "information_center"("created_by");

-- CreateIndex
CREATE INDEX "order_details_order_id_idx" ON "order_details"("order_id");

-- CreateIndex
CREATE INDEX "order_details_product_id_idx" ON "order_details"("product_id");

-- CreateIndex
CREATE INDEX "orders_order_to_idx" ON "orders"("order_to");

-- CreateIndex
CREATE INDEX "orders_source_idx" ON "orders"("source");

-- CreateIndex
CREATE INDEX "orders_status_idx" ON "orders"("status");

-- CreateIndex
CREATE INDEX "outbox_destination_idx" ON "outbox"("destination");

-- CreateIndex
CREATE UNIQUE INDEX "persons_id_number_key" ON "persons"("id_number");

-- CreateIndex
CREATE UNIQUE INDEX "persons_phone_no_key" ON "persons"("phone_no");

-- CreateIndex
CREATE INDEX "persons_sub_county_id_idx" ON "persons"("sub_county_id");

-- CreateIndex
CREATE UNIQUE INDEX "product_stocks_product_id_key" ON "product_stocks"("product_id");

-- CreateIndex
CREATE INDEX "product_stocks_person_id_idx" ON "product_stocks"("person_id");

-- CreateIndex
CREATE INDEX "product_stocks_product_id_idx" ON "product_stocks"("product_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_product_code_key" ON "products"("product_code");

-- CreateIndex
CREATE INDEX "sa_persons_person_id_idx" ON "sa_persons"("person_id");

-- CreateIndex
CREATE INDEX "sa_persons_created_by_idx" ON "sa_persons"("created_by");

-- CreateIndex
CREATE INDEX "sa_persons_updated_by_idx" ON "sa_persons"("updated_by");

-- CreateIndex
CREATE INDEX "sales_agent_products_product_id_idx" ON "sales_agent_products"("product_id");

-- CreateIndex
CREATE INDEX "sales_agent_products_sales_agent_id_idx" ON "sales_agent_products"("sales_agent_id");

-- CreateIndex
CREATE INDEX "sales_agent_stock_sales_agent_product_idx" ON "sales_agent_stock"("sales_agent_product");

-- CreateIndex
CREATE INDEX "sales_agent_stock_sales_agent_person_id_idx" ON "sales_agent_stock"("sales_agent_person_id");

-- CreateIndex
CREATE INDEX "stocks_person_id_idx" ON "stocks"("person_id");

-- CreateIndex
CREATE INDEX "stocks_created_by_idx" ON "stocks"("created_by");

-- CreateIndex
CREATE INDEX "stocks_product_id_idx" ON "stocks"("product_id");

-- CreateIndex
CREATE INDEX "supplier_persons_supplier_id_idx" ON "supplier_persons"("supplier_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "corp_vet_transfer" ADD CONSTRAINT "corp_vet_transfer_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "corp_vet_transfer" ADD CONSTRAINT "corp_vet_transfer_subcounty_from_fkey" FOREIGN KEY ("subcounty_from") REFERENCES "sub_county"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "corp_vet_transfer" ADD CONSTRAINT "corp_vet_transfer_subcounty_to_fkey" FOREIGN KEY ("subcounty_to") REFERENCES "sub_county"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "corps" ADD CONSTRAINT "corps_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "farmer_corp" ADD CONSTRAINT "farmer_corp_farmer_id_fkey" FOREIGN KEY ("farmer_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "farmer_corp" ADD CONSTRAINT "farmer_corp_corp_id_fkey" FOREIGN KEY ("corp_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "farmer_corp" ADD CONSTRAINT "farmer_corp_vet_id_fkey" FOREIGN KEY ("vet_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "farmer_transfer" ADD CONSTRAINT "farmer_transfer_registered_by_fkey" FOREIGN KEY ("registered_by") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "farmer_transfer" ADD CONSTRAINT "farmer_transfer_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "farmers" ADD CONSTRAINT "farmers_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "information_center" ADD CONSTRAINT "information_center_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product_stocks"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_source_fkey" FOREIGN KEY ("source") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_order_to_fkey" FOREIGN KEY ("order_to") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "persons" ADD CONSTRAINT "persons_sub_county_id_fkey" FOREIGN KEY ("sub_county_id") REFERENCES "sub_county"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stocks" ADD CONSTRAINT "product_stocks_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("product_id") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "product_stocks" ADD CONSTRAINT "product_stocks_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "sa_persons" ADD CONSTRAINT "sa_persons_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sa_persons" ADD CONSTRAINT "sa_persons_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sa_persons" ADD CONSTRAINT "sa_persons_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales_agent_products" ADD CONSTRAINT "sales_agent_products_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product_stocks"("product_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales_agent_products" ADD CONSTRAINT "sales_agent_products_sales_agent_id_fkey" FOREIGN KEY ("sales_agent_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales_agent_stock" ADD CONSTRAINT "sales_agent_stock_sales_agent_product_fkey" FOREIGN KEY ("sales_agent_product") REFERENCES "sales_agent_products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales_agent_stock" ADD CONSTRAINT "sales_agent_stock_sales_agent_person_id_fkey" FOREIGN KEY ("sales_agent_person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "persons"("person_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("product_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supplier_persons" ADD CONSTRAINT "supplier_persons_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("supplier_id") ON DELETE CASCADE ON UPDATE CASCADE;
