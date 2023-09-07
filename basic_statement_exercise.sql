-- 1. Use the albums_db database.
SHOW DATABASES;
USE albums_db;
SELECT DATABASE();
SHOW Tables;
DESCRIBE albums;

-- 2. What is the primary key for the albums table?
DESCRIBE albums;
#The Primary Key is id column

-- 3. What does the column named 'name' represent?
#The name of an album

-- 4. What do you think the sales column represents?
# The number of album sales (How much moeney it has brought in - Millions)

-- 5. Find the name of all albums by Pink Floyd.
SELECT artist, name 
FROM albums
WHERE artist = 'Pink Floyd';
# The two songs are The Dark Side of the Moon and The Wall
	

-- 6. What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT 
	name, 
    release_date 
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band'; 
# The release_date was 1967

-- 7. What is the genre for the album Nevermind?
SELECT artist, name, genre 
FROM albums
WHERE name = 'Nevermind';
# The genre is grunge, alternative rock

-- 8. Which albums were released in the 1990s?
SELECT name, release_date
FROM albums
WHERE release_date between 1990 and 1999;

/* There are 11 albums:
The bodygaurd
Jagged Little Pill
Come on Over
Falling into You
Let's talk about love
dangerous
the immaculate collection
Titanic: music from the motion picture
Metallica
nevermind
supernatural
*/


-- 9. Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT 
	name as low_selling_albums,
    sales    
FROM albums
WHERE sales < 20.0;
