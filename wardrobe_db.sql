-- Create users table with role
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);

-- Create categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create businesses table
CREATE TABLE businesses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create items table
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category_id INT,
    user_id INT,
    business_id INT,
    quantity INT DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (business_id) REFERENCES businesses(id)
);

-- Create images table
CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    file_path VARCHAR(255) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Note: Role-based access (admin/user) is enforced in your application logic, not in SQL. Only admins should be allowed to insert, update, or delete records via your PHP code. Users should only be able to view (SELECT) data. 