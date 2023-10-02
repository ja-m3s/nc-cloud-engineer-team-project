CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    age INT NOT NULL,
    profile_image_id VARCHAR(36),
    CONSTRAINT profile_image_id_unique UNIQUE (profile_image_id)
);