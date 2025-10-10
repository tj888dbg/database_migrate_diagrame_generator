-- 基础两张表：users、orders。orders.user_id 走 inline FK。
CREATE TABLE public.users (
                              id           BIGSERIAL PRIMARY KEY,
                              email        TEXT NOT NULL UNIQUE,
                              name         TEXT,
                              created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE public.orders (
                               id           BIGSERIAL PRIMARY KEY,
                               user_id      BIGINT NOT NULL REFERENCES public.users(id),
                               state        TEXT NOT NULL,
                               total_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
                               created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
