1. FINDING THE 5 OLDEST ACCOUNTS
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;

2. THE DAY OF THE WEEK WHERE MOST ACCOUNTS WHERE CREATED
SELECT 
    DAYNAME(created_at) AS day, COUNT(*) AS total
FROM
    users
GROUP BY day
ORDER BY total DESC;

3.FINDING THE MOST LIKED PHOTO AND THE USER WHO POSTED IT
SELECT 
    username, photos.id, photos.image_url, COUNT(*) AS total
FROM
    photos
        JOIN
    likes ON likes.photo_id = photos.id
        JOIN
    users ON photos.user_id = users.id
GROUP BY photo_id
ORDER BY total DESC
LIMIT 1;  

4.THE USER WHO NEVER POSTED A PHOTO
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photos.id IS NULL;

5.AVERAGE NUMBER OF TIMES AN USER POSTS

 SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS avg;

6. FIVE MOST POPULAR TAGS

SELECT 
    tag_name, COUNT(*) AS total
FROM
    PHOTO_TAGS
        JOIN
    tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY total DESC
LIMIT 5;

7. USERS LIKED ALL PHOTOS 

SELECT 
    username, COUNT(*) AS total
FROM
    likes
        JOIN
    users ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING total = (SELECT 
        COUNT(*)
    FROM
        photos)
        
        