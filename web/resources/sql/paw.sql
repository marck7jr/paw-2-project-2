CREATE TABLE account (
    id serial NOT NULL primary key
    , birthdate date
    , email character varying(255)
    , name character varying(255)
    , password character varying(255)
);

CREATE TABLE department (
    id serial NOT NULL primary key
    , name character varying(255)
);

CREATE TABLE product (
      id serial NOT NULL primary key
    , name character varying(255)
    , price double precision
    , units integer
    , department_id integer references department(id)
);

CREATE TABLE offer (
    id serial NOT NULL primary key
    , code character varying(255)
    , discount double precision
    , units integer
);

CREATE TABLE cart (
      id serial NOT NULL primary key
    , account_id integer references account(id)
    , offer_id integer references offer(id)
);

CREATE TABLE item (
    id serial NOT NULL primary key
    , units integer
    , cart_id integer references cart(id)
    , product_id integer references product(id)
);

CREATE TABLE cart_item (
      cart_id integer NOT NULL references cart(id)
    , items_id integer NOT NULL references item(id)
);
