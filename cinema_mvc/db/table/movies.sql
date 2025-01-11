CREATE TABLE movies (
    id SERIAL PRIMARY KEY,           
    title VARCHAR(200) NOT NULL,   
    duration INT NOT NULL,      
    age_rating VARCHAR(10) NOT NULL,    
    release_date DATE NOT NULL         
);