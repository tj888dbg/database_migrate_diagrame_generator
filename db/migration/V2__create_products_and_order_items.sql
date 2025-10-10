-- 再加两张表：products、order_items。
-- order_items 用表级复合主键，外键通过 ALTER TABLE 添加，方便测试你解析器的两种姿势。

CREATE TABLE public.products (
                                 id            BIGSERIAL PRIMARY KEY,
                                 product_name  TEXT NOT NULL,
                                 price         NUMERIC(12,2) NOT NULL
);

CREATE TABLE public.order_items (
                                    order_id       BIGINT NOT NULL,
                                    product_id     BIGINT NOT NULL,
                                    quantity       INTEGER NOT NULL DEFAULT 1,
                                    price_per_unit NUMERIC(12,2) NOT NULL,
                                    PRIMARY KEY (order_id, product_id)
);

ALTER TABLE public.order_items
    ADD CONSTRAINT order_items_order_fk
        FOREIGN KEY (order_id) REFERENCES public.orders(id);

ALTER TABLE public.order_items
    ADD CONSTRAINT order_items_product_fk
        FOREIGN KEY (product_id) REFERENCES public.products(id);
