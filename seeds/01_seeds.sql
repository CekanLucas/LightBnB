TRUNCATE users, properties, reservations, property_reviews RESTART IDENTITY CASCADE;

-- Insert Users
INSERT INTO users (name, email, password)
VALUES
('Jack Sparrow', 'matey@gmail.com', 'iratepirate28'),
('Chris Kringles', 'cracklepop@gmail.com', '12cracklepop'),
('Smarticus Assicus', 'smartass@gmail.com', 'passwordofsmartass'),
('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

-- Insert Properties
INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES
(1, 'Speedy Boat', 'description', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg', 93061, 6, 4, 8, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142', true),
(2, 'Slow Boat', 'description', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg', 40000, 2, 2, 4, 'Canada', '123 Main Street', 'Toronto', 'Ontario', 'M5V 2N2', true),
(3, 'Pirate Boat', 'description', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg', 50000, 1, 1, 1, 'Canada', '456 Ocean Avenue', 'Halifax', 'Nova Scotia', 'B3H 4R2', true);

-- Insert Reservations
INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES
(1, 1, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(3, 3, '2021-10-01', '2021-10-14');

-- Insert Property Reviews
INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES
(1, 1, 1, 3, 'messages'),
(2, 2, 2, 4, 'messages'),
(3, 3, 3, 4, 'messages');
