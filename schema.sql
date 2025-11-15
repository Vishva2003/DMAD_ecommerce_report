-- Create the database schema
CREATE TABLE product_categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    registration_date DATE NOT NULL,
    customer_tier TEXT CHECK(customer_tier IN ('Bronze', 'Silver', 'Gold', 'Platinum')) DEFAULT 'Bronze',
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    category_id INTEGER,
    price DECIMAL(10,2) NOT NULL CHECK(price >= 0),
    cost DECIMAL(10,2) NOT NULL CHECK(cost >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK(stock_quantity >= 0),
    weight_kg DECIMAL(8,3) CHECK(weight_kg >= 0),
    rating DECIMAL(3,2) CHECK(rating >= 0 AND rating <= 5),
    is_available BOOLEAN DEFAULT TRUE,
    created_date DATE NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    order_status TEXT CHECK(order_status IN ('Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled')) DEFAULT 'Pending',
    total_amount DECIMAL(10,2) NOT NULL CHECK(total_amount >= 0),
    shipping_address TEXT NOT NULL,
    payment_method TEXT CHECK(payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer')) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK(unit_price >= 0),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE(order_id, product_id)
);