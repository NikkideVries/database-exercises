-- Use the albums_db database.
SHOW DATABASES;
USE albums_db;
SELECT DATABASE();
SHOW Tables;
DESCRIBE albums;

-- What is the primary key for the albums table?
#The Primary Key is id 

-- What does the column named 'name' represent?
#The name of the song

-- What do you think the sales column represents?
# The number of sales the song has done (How much money it has brought in)

-- Find the name of all albums by Pink Floyd.
SELECT artist, name from albums
WHERE artist = 'Pink Floyd';
# The two songs are The Dark Side of the Moon and The Wall
	

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT name, release_date from albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band'; 
# The release_date was 1967

-- What is the genre for the album Nevermind?
SELECT artist, name, genre from albums
WHERE name = 'Nevermind';
# The genre is grunge, alternative rock

-- Which albums were released in the 1990s?
SELECT name, release_date from albums
WHERE release_date = 1990;
# the album released in 1990 is The Immaculate Collection

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT name as low_selling_albums from albums
WHERE sales < 20;