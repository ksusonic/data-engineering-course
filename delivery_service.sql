-- https://dbdesigner.page.link/R5RUvMDoC1iKGJV49
CREATE TABLE IF NOT EXISTS "clients" (
    "id" serial NOT NULL,
    "first_name" varchar(255) NOT NULL,
    "second_name" varchar(255) NOT NULL,
    "phone" varchar(20) NOT NULL,
    "email" varchar(50) NOT NULL,
    "create_time" timestamp
    with
        time zone NOT NULL DEFAULT 'now()',
        "update_time" timestamp
    with
        time zone NOT NULL,
        "delete_time" timestamp
    with
        time zone DEFAULT 'null',
        PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "couriers" (
    "id" serial NOT NULL,
    "first_name" varchar(255) NOT NULL,
    "second_name" varchar(255) NOT NULL,
    "phone" varchar(20) NOT NULL,
    "create_time" timestamp
    with
        time zone NOT NULL DEFAULT 'now()',
        "update_time" timestamp
    with
        time zone NOT NULL,
        "delete_time" timestamp
    with
        time zone DEFAULT 'null',
        PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id" serial NOT NULL,
    "client_id" integer NOT NULL,
    "status" smallint NOT NULL,
    "create_time" timestamp
    with
        time zone NOT NULL DEFAULT 'now()',
        "update_time" timestamp
    with
        time zone NOT NULL,
        PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "order_goods" (
    "id" serial NOT NULL,
    "order_id" bigint NOT NULL,
    "goods_id" bigint NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "goods" (
    "id" serial NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(255) NOT NULL,
    "category" bigint NOT NULL,
    "price" numeric(10, 0) NOT NULL,
    "create_time" timestamp
    with
        time zone NOT NULL DEFAULT 'now()',
        "update_time" timestamp
    with
        time zone NOT NULL,
        "delete_time" timestamp
    with
        time zone DEFAULT 'null',
        PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "deliveries" (
    "id" serial NOT NULL,
    "order_id" bigint NOT NULL,
    "courier_id" integer NOT NULL,
    "status" smallint NOT NULL,
    "create_time" timestamp
    with
        time zone NOT NULL DEFAULT 'now()',
        "deliver_until" timestamp
    with
        time zone,
        PRIMARY KEY ("id")
);

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "order_goods" ADD CONSTRAINT "order_goods_fk1" FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_goods" ADD CONSTRAINT "order_goods_fk2" FOREIGN KEY ("goods_id") REFERENCES "goods" ("id");

ALTER TABLE "deliveries" ADD CONSTRAINT "deliveries_fk1" FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "deliveries" ADD CONSTRAINT "deliveries_fk2" FOREIGN KEY ("courier_id") REFERENCES "couriers" ("id");
