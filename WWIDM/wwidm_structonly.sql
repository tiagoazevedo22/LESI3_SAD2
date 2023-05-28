/*
 Navicat Premium Data Transfer

 Source Server         : PostGreSQL_IPCA
 Source Server Type    : PostgreSQL
 Source Server Version : 120007 (120007)
 Source Host           : postgres2.ipca.pt:5432
 Source Catalog        : wwidm
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120007 (120007)
 File Encoding         : 65001

 Date: 28/05/2023 15:38:37
*/


-- ----------------------------
-- Table structure for dim_customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."dim_customer";
CREATE TABLE "public"."dim_customer" (
  "customerid" int4 NOT NULL,
  "customername" varchar(100) COLLATE "pg_catalog"."default",
  "billtocustomer" varchar(100) COLLATE "pg_catalog"."default",
  "customercategory" varchar(50) COLLATE "pg_catalog"."default",
  "buyinggroup" varchar COLLATE "pg_catalog"."default",
  "primarycontactperson" varchar(50) COLLATE "pg_catalog"."default",
  "city" varchar(50) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "stateprovincecode" varchar(5) COLLATE "pg_catalog"."default",
  "stateprovincename" varchar(50) COLLATE "pg_catalog"."default",
  "salesterritory" varchar(50) COLLATE "pg_catalog"."default",
  "country" varchar(60) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for dim_date
-- ----------------------------
DROP TABLE IF EXISTS "public"."dim_date";
CREATE TABLE "public"."dim_date" (
  "date_id" int4 NOT NULL,
  "date_day" date NOT NULL,
  "epoch" int8 NOT NULL,
  "day_suffix" varchar(4) COLLATE "pg_catalog"."default" NOT NULL,
  "day_name" varchar(9) COLLATE "pg_catalog"."default" NOT NULL,
  "day_of_week" int4 NOT NULL,
  "day_of_month" int4 NOT NULL,
  "day_of_quarter" int4 NOT NULL,
  "day_of_year" int4 NOT NULL,
  "week_of_month" int4 NOT NULL,
  "week_of_year" int4 NOT NULL,
  "week_of_year_iso" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "month_nr" int4 NOT NULL,
  "month_name" varchar(9) COLLATE "pg_catalog"."default" NOT NULL,
  "month_name_abbrev" char(3) COLLATE "pg_catalog"."default" NOT NULL,
  "quarter_nr" int4 NOT NULL,
  "quarter_name" varchar(9) COLLATE "pg_catalog"."default" NOT NULL,
  "year_actual" int4 NOT NULL,
  "first_day_of_week" date NOT NULL,
  "last_day_of_week" date NOT NULL,
  "first_day_of_month" date NOT NULL,
  "last_day_of_month" date NOT NULL,
  "first_day_of_quarter" date NOT NULL,
  "last_day_of_quarter" date NOT NULL,
  "first_day_of_year" date NOT NULL,
  "last_day_of_year" date NOT NULL,
  "mmyyyy" char(6) COLLATE "pg_catalog"."default" NOT NULL,
  "mmddyyyy" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "weekend_indr" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for dim_employee
-- ----------------------------
DROP TABLE IF EXISTS "public"."dim_employee";
CREATE TABLE "public"."dim_employee" (
  "personid" int4 NOT NULL,
  "fullname" varchar(50) COLLATE "pg_catalog"."default",
  "preferredname" varchar(50) COLLATE "pg_catalog"."default",
  "personjob" text COLLATE "pg_catalog"."default",
  "emailaddress" varchar(256) COLLATE "pg_catalog"."default",
  "customfields" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for dim_packagetype
-- ----------------------------
DROP TABLE IF EXISTS "public"."dim_packagetype";
CREATE TABLE "public"."dim_packagetype" (
  "packagetypeid" int4 NOT NULL,
  "packagetypename" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for dim_stockitem
-- ----------------------------
DROP TABLE IF EXISTS "public"."dim_stockitem";
CREATE TABLE "public"."dim_stockitem" (
  "stockitemid" int4 NOT NULL,
  "stockitemname" varchar(100) COLLATE "pg_catalog"."default",
  "color" varchar COLLATE "pg_catalog"."default",
  "unitpackage" varchar(50) COLLATE "pg_catalog"."default",
  "outerpackage" varchar(50) COLLATE "pg_catalog"."default",
  "brand" varchar COLLATE "pg_catalog"."default",
  "size" varchar COLLATE "pg_catalog"."default",
  "leadtimedays" int4,
  "quantityperouter" int4,
  "ischillerstock" int2,
  "taxrate" numeric(18,3),
  "unitprice" numeric(18,2),
  "recommendedretailprice" numeric(18,2),
  "weightperunit" numeric(18,3)
)
;

-- ----------------------------
-- Table structure for dim_time
-- ----------------------------
DROP TABLE IF EXISTS "public"."dim_time";
CREATE TABLE "public"."dim_time" (
  "timeid" numeric NOT NULL,
  "hms" time(6),
  "hourmin" text COLLATE "pg_catalog"."default",
  "hour" numeric,
  "minute" numeric,
  "quarterid" int4,
  "timeperiod" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ft_orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."ft_orders";
CREATE TABLE "public"."ft_orders" (
  "customerid" int4,
  "salespersonid" int4,
  "orderdate" date,
  "stockitemid" int4,
  "packagetypeid" int4,
  "orderid" int4,
  "backorderid" int4,
  "expecteddeliverydays" int4,
  "quantity" int4,
  "unitprice" numeric(18,2),
  "taxrate" numeric(18,3),
  "tax_amount" numeric(8,2),
  "total_amount" numeric(8,2)
)
;

-- ----------------------------
-- Table structure for ft_payments
-- ----------------------------
DROP TABLE IF EXISTS "public"."ft_payments";
CREATE TABLE "public"."ft_payments" (
  "customerid" int4,
  "paymentdate" date,
  "customertransactionid" int4,
  "paymentamount" numeric
)
;

-- ----------------------------
-- Table structure for ft_sales
-- ----------------------------
DROP TABLE IF EXISTS "public"."ft_sales";
CREATE TABLE "public"."ft_sales" (
  "customerid" int4,
  "ordercustomerid" int4,
  "salespersonid" int4,
  "packedbypersonid" int4,
  "invoicedate" date,
  "deliverytimeid" numeric,
  "stockitemid" int4,
  "packagetypeid" int4,
  "customerorder" varchar(20) COLLATE "pg_catalog"."default",
  "invoiceid" int4,
  "orderid" int4,
  "deliverydays" int4,
  "quantity" int4,
  "unitprice" numeric(18,2),
  "taxrate" numeric(18,3),
  "taxamount" numeric(18,2),
  "lineprofit" numeric(18,2),
  "total_amount" numeric(18,2)
)
;

-- ----------------------------
-- Indexes structure for table dim_customer
-- ----------------------------
CREATE INDEX "dim_customer_id_idx" ON "public"."dim_customer" USING btree (
  "customerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dim_customer
-- ----------------------------
ALTER TABLE "public"."dim_customer" ADD CONSTRAINT "dim_customer_id_pk" PRIMARY KEY ("customerid");

-- ----------------------------
-- Indexes structure for table dim_date
-- ----------------------------
CREATE UNIQUE INDEX "dim_date_date_day_idx" ON "public"."dim_date" USING btree (
  "date_day" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dim_date
-- ----------------------------
ALTER TABLE "public"."dim_date" ADD CONSTRAINT "dim_date_date_id_pk" PRIMARY KEY ("date_id");

-- ----------------------------
-- Indexes structure for table dim_employee
-- ----------------------------
CREATE INDEX "dim_employee_id_idx" ON "public"."dim_employee" USING btree (
  "personid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dim_employee
-- ----------------------------
ALTER TABLE "public"."dim_employee" ADD CONSTRAINT "dim_employee_id_pk" PRIMARY KEY ("personid");

-- ----------------------------
-- Indexes structure for table dim_packagetype
-- ----------------------------
CREATE INDEX "dim_packagetype_id_idx" ON "public"."dim_packagetype" USING btree (
  "packagetypeid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dim_packagetype
-- ----------------------------
ALTER TABLE "public"."dim_packagetype" ADD CONSTRAINT "dim_packagetype_id_pk" PRIMARY KEY ("packagetypeid");

-- ----------------------------
-- Indexes structure for table dim_stockitem
-- ----------------------------
CREATE INDEX "dim_stockitem_id_idx" ON "public"."dim_stockitem" USING btree (
  "stockitemid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dim_stockitem
-- ----------------------------
ALTER TABLE "public"."dim_stockitem" ADD CONSTRAINT "dim_stockitem_id_pk" PRIMARY KEY ("stockitemid");

-- ----------------------------
-- Indexes structure for table dim_time
-- ----------------------------
CREATE INDEX "dim_time_timeid_idx" ON "public"."dim_time" USING btree (
  "timeid" "pg_catalog"."numeric_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dim_time
-- ----------------------------
ALTER TABLE "public"."dim_time" ADD CONSTRAINT "dim_time_timeid_pk" PRIMARY KEY ("timeid");

-- ----------------------------
-- Foreign Keys structure for table ft_orders
-- ----------------------------
ALTER TABLE "public"."ft_orders" ADD CONSTRAINT "ft_orders_customer" FOREIGN KEY ("customerid") REFERENCES "public"."dim_customer" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_orders" ADD CONSTRAINT "ft_orders_orderdate" FOREIGN KEY ("orderdate") REFERENCES "public"."dim_date" ("date_day") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_orders" ADD CONSTRAINT "ft_orders_packagetype" FOREIGN KEY ("packagetypeid") REFERENCES "public"."dim_packagetype" ("packagetypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_orders" ADD CONSTRAINT "ft_orders_salesperson" FOREIGN KEY ("salespersonid") REFERENCES "public"."dim_employee" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_orders" ADD CONSTRAINT "ft_orders_stockitem" FOREIGN KEY ("stockitemid") REFERENCES "public"."dim_stockitem" ("stockitemid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ft_payments
-- ----------------------------
ALTER TABLE "public"."ft_payments" ADD CONSTRAINT "fk_orders_paymentdate" FOREIGN KEY ("paymentdate") REFERENCES "public"."dim_date" ("date_day") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_payments" ADD CONSTRAINT "ft_payments_customer" FOREIGN KEY ("customerid") REFERENCES "public"."dim_customer" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ft_sales
-- ----------------------------
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_invoice_stockitemid" FOREIGN KEY ("stockitemid") REFERENCES "public"."dim_stockitem" ("stockitemid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_customer" FOREIGN KEY ("customerid") REFERENCES "public"."dim_customer" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_deliverytime" FOREIGN KEY ("deliverytimeid") REFERENCES "public"."dim_time" ("timeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_invoicedate" FOREIGN KEY ("invoicedate") REFERENCES "public"."dim_date" ("date_day") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_ordercustomer" FOREIGN KEY ("ordercustomerid") REFERENCES "public"."dim_customer" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_packagetype" FOREIGN KEY ("packagetypeid") REFERENCES "public"."dim_packagetype" ("packagetypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_packedbyperson" FOREIGN KEY ("packedbypersonid") REFERENCES "public"."dim_employee" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ft_sales" ADD CONSTRAINT "ft_sales_salesperson" FOREIGN KEY ("salespersonid") REFERENCES "public"."dim_employee" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
