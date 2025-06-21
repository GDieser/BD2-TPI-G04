
USE BD2_TPI_G04

GO

--Insert Tipo mem

INSERT INTO TipoMembresia (Nombre, Precio, PlazoDuracion, Descripcion)
VALUES ('Básica', 4.99, 30, 'Acceso a música ilimitada con anuncios y calidad estándar (128kbps)');

INSERT INTO TipoMembresia (Nombre, Precio, PlazoDuracion, Descripcion)
VALUES ('Premium', 9.99, 30, 'Música sin anuncios, calidad alta (320kbps) y opción de descarga');

INSERT INTO TipoMembresia (Nombre, Precio, PlazoDuracion, Descripcion)
VALUES ('Familiar', 14.99, 30, 'Plan para hasta 6 usuarios con todas las ventajas Premium y control parental');


--Insert Genero musical

INSERT INTO GeneroMusical (Nombre, Descripcion) 
VALUES ('Rock', 'Género musical surgido en los años 50 caracterizado por guitarras eléctricas y ritmos fuertes');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Pop', 'Música popular que suele tener melodías pegadizas y estructuras simples');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Jazz', 'Género originario de comunidades afroamericanas con improvisación y ritmos sincopados');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Clásica', 'Música de origen europeo compuesta aproximadamente entre 1750 y 1820');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Hip Hop', 'Cultura musical que incluye rap, DJing, breakdance y graffiti, originada en los 70s en NYC');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Electrónica', 'Música creada principalmente con sintetizadores y equipos electrónicos');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Reggae', 'Género jamaiquino con ritmos relajados y mensajes sociales o espirituales');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Salsa', 'Música bailable con raíces cubanas que mezcla son montuno, jazz y otros ritmos');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Country', 'Género folclórico estadounidense con raíces en la música tradicional de los Apalaches');

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Metal', 'Subgénero del rock más extremo con distorsión potente y tempos rápidos');


--Insert tipo de contenido

INSERT INTO TipoContenido (Nombre, Descripcion)
VALUES 
('Canción', 'Pista musical'),
('Podcast', 'Charlas con tematicas variadas'),
('Audiolibro', 'Narraciones sobre las obras más populares');

--Insert Artistas

INSERT INTO Artista (Nombre, Apellido, NombreArtistico, FechaNacimiento, ImagenPerfil)
VALUES
('Freddie', 'Mercury', 'Freddie Mercury', '1946-09-05', 'https://www.rockandrollarmy.com/magazine/wp-content/uploads/2017/11/freddie-mercury-1.jpg'),
('Mick', 'Jagger', 'Mick Jagger', '1943-07-26', 'https://media.diariouno.com.ar/p/a3293fab928dc337c5b485c68f6b3c10/adjuntos/298/imagenes/009/573/0009573204/1200x0/smart/mickjpg.jpg'),
('Michael', 'Jackson', 'Michael Jackson', '1958-08-29', 'https://www.rockaxis.com/img/newsList/2656847.jpg'),
('Madonna', 'Ciccone', 'Madonna', '1958-08-16', 'https://indiehoy.com/wp-content/uploads/2024/08/madonna-5-mejores-canciones.jpg'),
('Louis', 'Armstrong', 'Louis Armstrong', '1901-08-04', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Louis_Armstrong_in_Color_%28restored%29.jpg/1200px-Louis_Armstrong_in_Color_%28restored%29.jpg'),
('Miles', 'Davis', 'Miles Davis', '1926-05-26', 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/08/11/16602301466447.jpg'),
('Wolfgang', 'Mozart', 'Mozart', '1756-01-27', 'https://www.dallassymphony.org/wp-content/uploads/2022/04/Wolfgang-Amadeus-Mozart.jpg'),
('Ludwig', 'Beethoven', 'Beethoven', '1770-12-17', 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Beethoven.jpg'),
('Tupac', 'Shakur', '2Pac', '1971-06-16', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/2pac_edit_cropped_further.jpg/250px-2pac_edit_cropped_further.jpg'),
('Shawn', 'Carter', 'Jay-Z', '1969-12-04', 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Jay-Z_%40_Shawn_%27Jay-Z%27_Carter_Foundation_Carnival_%28crop_2%29.jpg'),
('David', 'Guetta', 'David Guetta', '1967-11-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/2023-11-16_Gala_de_los_Latin_Grammy%2C_22_%28David_Guetta%29.jpg/1200px-2023-11-16_Gala_de_los_Latin_Grammy%2C_22_%28David_Guetta%29.jpg'),
('Calvin', 'Harris', 'Calvin Harris', '1984-01-17', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Calvin_Harris_-_Rock_in_Rio_Madrid_2012_-_09.jpg/260px-Calvin_Harris_-_Rock_in_Rio_Madrid_2012_-_09.jpg'),
('Bob', 'Marley', 'Bob Marley', '1945-02-06', 'https://los40.com/resizer/Dkyemrqk0kAqueUEv3uE8HeyUro=/arc-photo-prisaradiolos40/eu-central-1-prod/public/7MXALJJQTJC5LM5TZY3FEIETUA.jpg'),
('Peter', 'Tosh', 'Peter Tosh', '1944-10-19', 'https://cdn-images.dzcdn.net/images/artist/31c0c1dfc699039efb7921adeed33721/1900x1900-000000-80-0-0.jpg'),
('Marc', 'Anthony', 'Marc Anthony', '1968-09-16', 'https://cdn.trembol.com/wp-content/uploads/2021/03/Marc-Anthony-15.jpg'),
('Celia', 'Cruz', 'Celia Cruz', '1925-10-21', 'https://upload.wikimedia.org/wikipedia/commons/7/75/Celia_Cruz%2C_1957.jpg'),
('Johnny', 'Cash', 'Johnny Cash', '1932-02-26', 'https://indierocks.sfo3.cdn.digitaloceanspaces.com/wp-content/uploads/bfi_thumb/JohnnyCash_Cumplea%C3%B1os_-50mrvps6ytzxyjc62hqfpg2ttp93m8zsgoijtqzposhr3yqxc0agcjb696pef4.jpg'),
('Dolly', 'Parton', 'Dolly Parton', '1946-01-19', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Young-Dolly-Parton.jpg/250px-Young-Dolly-Parton.jpg'),
('James', 'Hetfield', 'James Hetfield', '1963-08-03', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/2024-07-12_DSC03974.jpg/960px-2024-07-12_DSC03974.jpg'),
('Bruce', 'Dickinson', 'Bruce Dickinson', '1958-08-07', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/01_Bruce_Dickinson_-_The_Mandrake_Project_%281%29_%2853818073705%29_Cropped.jpg'),
('Scott', 'Brick', 'Scott Brick', '1966-01-30', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Scott_Brick_%28headshot%2C_2012%29.jpg/1200px-Scott_Brick_%28headshot%2C_2012%29.jpg'),  -- Narrador de audiolibros
('Frank', 'Muller', 'Frank Muller', '1951-07-17', 'https://www.audiofilemagazine.com/images/400x400/content/uploaded/images/narrators/frank-muller-600x415.jpg'),  -- narrador 
('Alan', 'Martínez', 'Alan Estrada', '1986-05-12', 'https://proassets.planetadelibros.com/usuaris/seudonimos/fotos/47/original/000046579_1_AlanEstrada.jpg'),  -- Podcaster
('Ricardo', 'Pérez', 'Ricardo Pérez', '1980-11-03', 'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/XGNTCS725RGCJM3TSSXGLTDPC4.JPG');  -- Podcaster

-- Insert Idiomas

INSERT INTO Idioma(Nombre) VALUES ('Ingles'), ('Español'), ('Portugues')

--Insert Interprete

INSERT INTO Interprete (Nombre, FechaConsolidacion, Tipo, Descripcion)
VALUES
('Queen', '1973-01-01', 'Banda', 'Legendaria banda de rock británica liderada por Freddie Mercury'),
('The Rolling Stones', '1962-01-01', 'Banda', 'Iconica banda de rock británica con Mick Jagger como vocalista'),
('Michael Jackson', '1971-01-01', 'Solista', 'El "Rey del Pop", comenzó con los Jackson 5 pero se consolidó como solista'),
('Madonna', '1982-01-01', 'Solista', 'La "Reina del Pop", una de las artistas solistas más influyentes'),
('Louis Armstrong', '1920-01-01', 'Solista', 'Trompetista y cantante de jazz, pionero como solista'),
('Miles Davis Quintet', '1955-01-01', 'Grupo', 'Histórica formación de jazz liderada por Miles Davis'),
('Mozart', '1762-01-01', 'Solista', 'Genio compositor clásico que se presentaba como solista'),
('Beethoven', '1795-01-01', 'Solista', 'Compositor y pianista clásico que actuaba como solista'),
('2Pac', '1991-01-01', 'Solista', 'Influyente rapero solista del hip-hop estadounidense'),
('Jay-Z', '1996-01-01', 'Solista', 'Uno de los raperos solistas más exitosos comercialmente'),
('David Guetta', '2002-01-01', 'Solista', 'DJ y productor solista de música electrónica'),
('Calvin Harris', '2007-01-01', 'Solista', 'DJ y productor escocés de música electrónica'),
('Bob Marley & The Wailers', '1963-01-01', 'Banda', 'La banda más famosa de reggae liderada por Bob Marley'),
('Peter Tosh', '1976-01-01', 'Solista', 'Ex miembro de The Wailers que continuó como solista'),
('Marc Anthony', '1993-01-01', 'Solista', 'Cantante solista de salsa y pop latino'),
('Celia Cruz', '1950-01-01', 'Solista', 'La "Reina de la Salsa", carrera principalmente como solista'),
('Johnny Cash', '1954-01-01', 'Solista', 'Leyenda de la música country como artista solista'),
('Dolly Parton', '1967-01-01', 'Solista', 'Icono femenino del country como solista'),
('Metallica', '1981-01-01', 'Banda', 'Banda de thrash metal con James Hetfield como vocalista'),
('Iron Maiden', '1975-01-01', 'Banda', 'Banda de heavy metal con Bruce Dickinson como vocalista'),
('Scott Brick', '1990-01-01', 'Solista', 'Narrador solista de audiolibros'),
('Frank Muller', '1980-01-01', 'Solista', 'Narrador solista de audiolibros'),
('Alan Estrada', '2015-01-01', 'Solista', 'Podcaster solista de viajes y cultura'),
('Leyendas Legendarias', '2016-01-01', 'Grupo', 'Grupo de podcasters de misterio y casos paranormales');

--Insert Rol

INSERT INTO Rol(Nombre) VALUES ('USER'), ('ADMIN')

--Insert usuarios

INSERT INTO Usuario (NombreUsuario, Nombre, Apellido, Email, Pass, FechaNacimiento, Pais, FotoPerfil, IdIdioma, IdRol)
VALUES
('admin123', 'Pepe', 'Pérez', 'admin@gmail.com', '1234', '1999-05-10', 'Argentina', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 2),
('juan123', 'Juan', 'Pérez', 'juan@gmail.com', '1234', '1995-05-10', 'Argentina', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('maria_g', 'María', 'García', 'maria@gmail.com', '1234', '1992-08-15', 'Chile', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('lucas22', 'Lucas', 'Rodríguez', 'lucas@gmail.com', '1234', '1990-12-01', 'México', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('ana_lo', 'Ana', 'López', 'ana@gmail.com', '1234', '1998-04-20', 'Colombia', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('tomi98', 'Tomás', 'Fernández', 'tomas@gmail.com', '1234', '1996-07-30', 'Uruguay', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('sofia_b', 'Sofía', 'Benítez', 'sofia@gmail.com', '1234', '1999-03-25', 'Argentina', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('daniel_t', 'Daniel', 'Torres', 'daniel@gmail.com', '1234', '1985-11-13', 'Perú', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('carla_h', 'Carla', 'Herrera', 'carla@gmail.com', '1234', '1993-06-05', 'Chile', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('leo_b', 'Leandro', 'Bustos', 'leandro@gmail.com', '1234', '1989-09-28', 'Argentina', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('flor_c', 'Florencia', 'Cruz', 'florencia@gmail.com', '1234', '1997-01-17', 'Ecuador', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('martin_r', 'Martín', 'Ramírez', 'martin@gmail.com', '1234', '1994-10-12', 'Paraguay', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('vale_m', 'Valentina', 'Mendoza', 'valentina@gmail.com', '1234', '1992-02-09', 'Argentina', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('fede_c', 'Federico', 'Correa', 'fede@gmail.com', '1234', '1987-12-31', 'Chile', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('romi_v', 'Romina', 'Vega', 'romina@gmail.com', '1234', '1995-08-08', 'México', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1),
('gabi_p', 'Gabriel', 'Paredes', 'gabriel@gmail.com', '1234', '1991-03-14', 'Argentina', 'https://cdn.pixabay.com/photo/2015/01/09/10/14/clef-593912_1280.jpg', 1, 1);


--Insert usuario membresia:

INSERT INTO UsuarioMembresia (IdUsuario, IdTipoMembresia, FechaInicio, FechaVencimiento, Activa)
VALUES
(1, 1, '2025-06-15', '2025-07-15', 1),
(1, 2, '2025-06-20', '2025-07-20', 1),
(2, 3, '2025-06-01', '2025-07-01', 1),
(3, 1, '2025-05-01', '2025-05-31', 0),
(3, 2, '2025-06-10', '2025-07-10', 1),
(4, 1, '2025-06-05', '2025-07-05', 1),
(5, 3, '2025-04-20', '2025-05-20', 0),
(5, 1, '2025-06-18', '2025-07-18', 1),
(6, 2, '2025-03-15', '2025-04-15', 0),
(6, 3, '2025-06-01', '2025-07-01', 1),
(7, 1, '2025-06-15', '2025-07-15', 1),
(8, 2, '2025-05-22', '2025-06-22', 0),
(9, 3, '2025-06-10', '2025-07-10', 1),
(10, 1, '2025-04-10', '2025-05-10', 0),
(11, 2, '2025-06-12', '2025-07-12', 1),
(12, 3, '2025-05-30', '2025-06-30', 0),
(13, 1, '2025-06-08', '2025-07-08', 1),
(14, 2, '2025-05-05', '2025-06-05', 0),
(15, 3, '2025-06-01', '2025-07-01', 1),
(16, 1, '2025-04-25', '2025-05-25', 0),
(16, 2, '2025-06-19', '2025-07-19', 1);

-- insert ArtistaSeguido

-- Insert productora

INSERT INTO Productora (Nombre, PaisOrigen, Web, Logo, IdAdministrador)
VALUES
('Sony Music Entertainment', 'Estados Unidos', 'www.sonymusic.com', 'https://cdn-p.smehost.net/sites/005297e5d91d4996984e966fac4389ea/wp-content/uploads/2020/06/SME-logo-on-black-background.jpg', 1),
('Universal Music Group', 'Países Bajos', 'www.universalmusic.com', 'https://s3-symbol-logo.tradingview.com/universal-music-group-n-v--600.png', 3),
('Warner Music Group', 'Estados Unidos', 'www.warnermusic.com', 'https://i1.sndcdn.com/avatars-000072186935-ssnqxr-t1080x1080.jpg', 5),
('Independiente Records', 'Argentina', 'www.independienterecords.com.ar', 'https://concord.com/wp-content/uploads/2018/07/INDEPENDIENTE-RECORDS-logo-2.png', 7),
('Top Dawg Entertainment', 'Estados Unidos', 'www.tdeent.com', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Top_Dawg_Ent._logo.webp/200px-Top_Dawg_Ent._logo.webp.png', 9);


--Insert Playlist: 

INSERT INTO Playlist (Nombre, EsPublica, Descripcion, ImagenURL, FechaCreacion, IdAdministrador)
VALUES
('Clásicos del Rock', 1, 'Las mejores canciones de rock de todos los tiempos', 'https://cdn-images.dzcdn.net/images/cover/c04bb27e786e851ab9c8f20cfdadd446/0x1900-000000-80-0-0.jpg', '2023-01-15', 1),
('Pop Hits 2023', 1, 'Lo más nuevo y popular en música pop', 'https://i1.sndcdn.com/artworks-000246694717-e7cnzz-t500x500.jpg', '2023-05-01', 4),
('Jazz para Relajarse', 0, 'Selección suave de jazz para momentos tranquilos', 'https://cdn-p.smehost.net/sites/5b3bac59eb36401694af3a241173447f/wp-content/uploads/2018/07/ab67706c0000da84ba3e013a1689536223f2e104.jpg', '2023-03-10', 1),
('Hip Hop Essentials', 1, 'Lo fundamental del hip hop estadounidense', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/hip-hop-spotify-playlist-cover-design-template-eb9d61a39fd0772fd8f6774a228a0cf0_screen.jpg?ts=1685333804', '2022-11-20', 8),
('Éxitos de Salsa', 1, 'Los grandes clásicos de la salsa latina', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/hip-hop-spotify-playlist-cover-design-template-eb9d61a39fd0772fd8f6774a228a0cf0_screen.jpg?ts=1685333804', '2023-02-28', 10),
('Metal Pesado', 0, 'Para los amantes del metal más intenso', 'https://i.ytimg.com/vi/3vMGJbj1t9k/maxresdefault.jpg', '2023-04-05', 12),
('Country Road Trip', 1, 'La mejor música country para viajes por carretera', 'https://cdn.sanity.io/images/o6uq28nb/production/658f5094610e77bd03d8aca1599948814cb3412d-1280x1280.jpg?w=600&h=600&auto=format', '2023-01-30', 1),
('Electrónica para Bailar', 1, 'Pistas electrónicas que no puedes dejar de bailar', 'https://resources.tidal.com/images/4247e297/4330/4b19/9714/c2bb4f6740f3/640x640.jpg', '2023-06-01', 1),
('Reggae Vibes', 1, 'La esencia del reggae y sus mensajes positivos', 'https://colectivosonoro.com/wp-content/uploads/2016/09/regga.jpg', '2023-03-22', 3),
('Audiolibros Clásicos', 0, 'Grandes obras literarias en formato audiolibro', 'https://images.cdn2.buscalibre.com/fit-in/360x360/f8/c4/f8c4ca7ea4798c206eb7a47f1b5a64ea.jpg', '2023-05-15', 5);

--Insert Albumnes

INSERT INTO Album (Titulo, IdProductora, FechaLanzamiento, Portada, IdGenero, IdTipoContenido)
VALUES
('A Night at the Opera', 1, '1975-11-21', 'https://upload.wikimedia.org/wikipedia/en/4/4d/Queen_A_Night_At_The_Opera.png', 1, 1),    
('Thriller', 2, '1982-11-30', 'https://upload.wikimedia.org/wikipedia/en/8/89/Michael_jackson_thriller_12_inch_single_USA.jpg', 2, 1),  
('Kind of Blue', 3, '1959-08-17', 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Kind_of_Blue_%281959%2C_CL_1355%29_album_cover.jpg', 3, 1),    
('Piece of Mind ', 1, '1983-05-16', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/85/Iron_Maiden_-_Piece_Of_Mind.jpg/250px-Iron_Maiden_-_Piece_Of_Mind.jpg', 10, 1),           
('One Love: The Very Best', 2, '2001-07-16', 'https://upload.wikimedia.org/wikipedia/en/9/98/One_LoveThe_Very_Best_of_Bob_Marley_%26_The_Wailers.jpg', 7, 1), 
('Metallica (The Black Album)', 3, '1991-08-12', 'https://upload.wikimedia.org/wikipedia/ru/c/c2/Metallica_Album.jpg', 10, 1), 
('Like a Virgin', 1, '1984-11-12', 'https://upload.wikimedia.org/wikipedia/en/1/17/LikeAVirgin1984.png', 2, 1),             
('Vivir', 5, '1997-02-11', 'https://i.ytimg.com/vi/kMNPv_HXffQ/maxresdefault.jpg', 8, 1),                         
('Jolene', 4, '1974-02-04', 'https://upload.wikimedia.org/wikipedia/en/a/ab/Jolene_%28Dolly_Parton_album_-_cover_art%29.jpg', 9, 1);     

--Insert Contenido

INSERT INTO Contenido (Titulo, IdTipoContenido, IdAlbum, IdGenero, IdProductora, FechaLanzamiento, Duracion, Portada, FechaSubida, IDUsuarioDueño, FormatoArchivo, Descripcion, Activo, ContadorReproducciones)
VALUES
-- album: A Night at the Opera (Queen)
('Bohemian Rhapsody', 1, 1, 1, 1, '1975-10-31', 354, 'https://upload.wikimedia.org/wikipedia/en/4/4d/Queen_A_Night_At_The_Opera.png', '2022-01-10', 2, 'mp3', 'Legendaria ópera rock de 6 minutos', 1, 125),
('You''re My Best Friend', 1, 1, 1, 1, '1975-05-18', 172, 'https://upload.wikimedia.org/wikipedia/en/4/4d/Queen_A_Night_At_The_Opera.png', '2022-01-10', 2, 'mp3', 'Dulce canción dedicada a la amistad', 1, 45),
('Love of My Life', 1, 1, 1, 1, '1975-11-21', 218, 'https://upload.wikimedia.org/wikipedia/en/4/4d/Queen_A_Night_At_The_Opera.png', '2022-01-10', 2, 'mp3', 'Balada romántica de Freddie Mercury', 1, 680),
('We Will Rock You', 1, 1, 1, 1, '1977-10-07', 122, 'https://upload.wikimedia.org/wikipedia/en/4/4d/Queen_A_Night_At_The_Opera.png', '2022-01-15', 2, 'mp3', 'Himno del rock con percusión corporal', 1, 95),

-- album: Thriller (Michael Jackson)
('Thriller', 1, 2, 2, 2, '1982-11-30', 357, 'https://upload.wikimedia.org/wikipedia/en/8/89/Michael_jackson_thriller_12_inch_single_USA.jpg', '2021-05-15', 4, 'mp4', 'Video musical icónico con zombies', 1, 85),
('Billie Jean', 1, 2, 2, 2, '1983-01-02', 294, 'https://upload.wikimedia.org/wikipedia/en/8/89/Michael_jackson_thriller_12_inch_single_USA.jpg', '2021-05-15', 4, 'mp3', 'Uno de los mayores éxitos de MJ', 1, 120),
('Beat It', 1, 2, 2, 2, '1983-02-14', 258, 'https://upload.wikimedia.org/wikipedia/en/8/89/Michael_jackson_thriller_12_inch_single_USA.jpg', '2021-05-15', 4, 'mp4', 'Fusión de rock y pop con Eddie Van Halen', 1, 95),
('Smooth Criminal', 1, 2, 2, 2, '1988-10-31', 258, 'https://upload.wikimedia.org/wikipedia/en/8/89/Michael_jackson_thriller_12_inch_single_USA.jpg', '2021-06-10', 4, 'mp4', 'Coreografía inclinada imposible', 1, 750),

-- album: Kind of Blue (Miles Davis)
('So What', 1, 3, 3, 3, '1959-08-17', 562, 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Kind_of_Blue_%281959%2C_CL_1355%29_album_cover.jpg', '2020-11-20', 6, 'flac', 'Pieza maestra del jazz modal', 1, 350),
('Blue in Green', 1, 3, 3, 3, '1959-08-17', 338, 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Kind_of_Blue_%281959%2C_CL_1355%29_album_cover.jpg', '2020-11-20', 6, 'flac', 'Balada jazzística atmosférica', 1, 28),

-- album: Piece of Mind (Iron Maiden)
('The Trooper', 1, 4, 10, 3, '1983-06-20', 251, 'https://upload.wikimedia.org/wikipedia/en/thumb/8/85/Iron_Maiden_-_Piece_Of_Mind.jpg/250px-Iron_Maiden_-_Piece_Of_Mind.jpg', '2023-02-15', 8, 'mp3', 'Clásico basado en la carga de la Brigada Ligera', 1, 450),
('Flight of Icarus', 1, 4, 10, 3, '1983-04-11', 228, 'https://upload.wikimedia.org/wikipedia/en/thumb/8/85/Iron_Maiden_-_Piece_Of_Mind.jpg/250px-Iron_Maiden_-_Piece_Of_Mind.jpg', '2023-02-15', 8, 'mp3', 'Adaptación del mito griego', 1, 320),
('Run to the Hills', 1, 4, 10, 3, '1982-02-12', 231, 'https://upload.wikimedia.org/wikipedia/en/thumb/8/85/Iron_Maiden_-_Piece_Of_Mind.jpg/250px-Iron_Maiden_-_Piece_Of_Mind.jpg', '2023-02-18', 8, 'mp3', 'Sobre la colonización de América', 1, 380),

-- album: One Love (Bob Marley)
('No Woman, No Cry', 1, 5, 7, 2, '1974-09-23', 428, 'https://upload.wikimedia.org/wikipedia/en/9/98/One_LoveThe_Very_Best_of_Bob_Marley_%26_The_Wailers.jpg', '2021-07-05', 10, 'mp3', 'Versión en vivo legendaria', 1, 38),
('Three Little Birds', 1, 5, 7, 2, '1977-05-23', 181, 'https://upload.wikimedia.org/wikipedia/en/9/98/One_LoveThe_Very_Best_of_Bob_Marley_%26_The_Wailers.jpg', '2021-07-05', 10, 'mp3', 'Mensaje positivo icónico', 1, 42),
('Redemption Song', 1, 5, 7, 2, '1980-06-10', 198, 'https://upload.wikimedia.org/wikipedia/en/9/98/One_LoveThe_Very_Best_of_Bob_Marley_%26_The_Wailers.jpg', '2021-07-08', 10, 'mp3', 'Última canción de Marley, acústica', 1, 290),

-- album: Metallica (Black Album)
('Enter Sandman', 1, 6, 10, 3, '1991-07-29', 331, 'https://upload.wikimedia.org/wikipedia/ru/c/c2/Metallica_Album.jpg', '2022-09-10', 12, 'mp3', 'Riff icónico del metal', 1, 650),
('Nothing Else Matters', 1, 6, 10, 3, '1992-04-20', 388, 'https://upload.wikimedia.org/wikipedia/ru/c/c2/Metallica_Album.jpg', '2022-09-10', 12, 'mp3', 'Balada power metal', 1, 580),
('Wherever I May Roam', 1, 6, 10, 3, '1992-10-05', 404, 'https://upload.wikimedia.org/wikipedia/ru/c/c2/Metallica_Album.jpg', '2022-09-12', 12, 'mp3', 'Sobre la vida nómada', 1, 420),

-- album: Like a Virgin (Madonna)
('Like a Virgin', 1, 7, 2, 1, '1984-11-12', 238, 'https://upload.wikimedia.org/wikipedia/en/1/17/LikeAVirgin1984.png', '2023-01-20', 1, 'mp4', 'Tema que lanzó a Madonna al estrellato', 1, 55),
('Material Girl', 1, 7, 2, 1, '1985-01-30', 244, 'https://upload.wikimedia.org/wikipedia/en/1/17/LikeAVirgin1984.png', '2023-01-20', 1, 'mp4', 'Crítica social disfrazada de pop', 1, 48),

-- album: Vivir (Marc Anthony)
('Vivir Lo Nuestro', 1, 8, 8, 5, '1997-02-11', 328, 'https://i.ytimg.com/vi/kMNPv_HXffQ/maxresdefault.jpg', '2022-11-15', 9, 'mp3', 'Dúo con La India, clásico salsa', 1, 25),
('Hasta Que Te Conocí', 1, 8, 8, 5, '1997-02-11', 432, 'https://i.ytimg.com/vi/kMNPv_HXffQ/maxresdefault.jpg', '2022-11-15', 9, 'mp3', 'Versión salsa de tema de Juan Gabriel', 1, 18),

-- album: Jolene (Dolly Parton)
('Jolene', 1, 9, 9, 4, '1973-10-15', 162, 'https://upload.wikimedia.org/wikipedia/en/a/ab/Jolene_%28Dolly_Parton_album_-_cover_art%29.jpg', '2021-12-05', 14, 'flac', 'La canción más famosa de Dolly', 1, 32),
('I Will Always Love You', 1, 9, 9, 4, '1974-06-03', 247, 'https://upload.wikimedia.org/wikipedia/en/a/ab/Jolene_%28Dolly_Parton_album_-_cover_art%29.jpg', '2021-12-05', 14, 'flac', 'Original que luego versionó Whitney', 1, 28);


--Insert interprete por Album

INSERT INTO InterpretePorAlbum (IdInterprete, IdAlbum)
VALUES
-- Queen - A Night at the Opera
(1, 1),  
-- Michael Jackson - Thriller 
(4, 2), 
-- Miles Davis - Kind of Blue 
(6, 3), 
-- Iron Maiden - Piece of Mind 
(20, 4), 
-- Bob Marley - One Love 
(13, 5),
-- Metallica - Black Album
(19, 6),
-- Madonna - Like a Virgin 
(4, 7),
-- Marc Anthony - Vivir
(15, 8),
-- Dolly Parton - Jolene 
(18, 9);

--insert interprete por artista

INSERT INTO InterpreteArtista (IdInterprete, IdArtista, FechaSalida, Observaciones)
VALUES
-- Queen 
(1, 1, NULL, 'Freddie Mercury fue el vocalista principal de Queen hasta su fallecimiento en 1991'),
-- The Rolling Stones 
(2, 2, NULL, 'Mick Jagger es el vocalista principal desde la formación de la banda'),
-- Bob Marley & The Wailers 
(13, 13, NULL, 'Bob Marley fue el líder y vocalista principal'),
(13, 14, '1974-01-01', 'Peter Tosh dejó The Wailers para comenzar su carrera solista'),
-- Metallica 
(19, 19, NULL, 'James Hetfield es vocalista y guitarrista rítmico'),
-- Iron Maiden 
(20, 20, NULL, 'Bruce Dickinson es el vocalista desde 1981 (excepto 1993-1999)'),
-- Miles Davis Quintet 
(6, 6, NULL, 'Miles Davis fue el líder y trompetista del quinteto'),
(13, 16, NULL, 'Celia Cruz colaboró frecuentemente con artistas de reggae'); --modo de ejemplo

--Insert cont favorito

--Insert comentarios: 

INSERT INTO Comentarios (IdUsuario, IdContenido, Comentario, FechaComentario)
VALUES
(3, 1, 'Nadie compondrá algo así jamás. Mercury era un genio absoluto', '2023-02-15'),
(7, 1, 'La parte operística me pone la piel de gallina cada vez', '2023-11-22'),
(5, 1, 'No entiendo la letra pero igual me encanta', '2024-08-14'),
(12, 1, 'La película no le hace justicia a esta obra maestra', '2023-12-25'),
(1, 2, 'Youare My Best Friend me recuerda a mi perro <3', '2024-11-30'),
(2, 4, 'El videoclip sigue dando miedo después de 40 años', '2024-01-13'),
(6, 3, 'Love of My Life es mi canción de bodas', '2025-03-22'),
(11, 4, 'Vincent Price hizo que esta canción fuera legendaria', '2023-10-31'),
(8, 4, 'Mi abuela todavía se asusta con el videoclip jaja', '2025-02-28'),
(15, 4, 'Ojalá hicieran música así hoy en día', '2024-01-07'),
(10, 5, 'Billie Jean no es mi hijo! JAJAJA clásico', '2023-05-06'),
(14, 7, 'So What es jazz en su estado más puro', '2024-06-08'),
(5, 10, 'El solo de guitarra es de otro planeta!', '2024-03-08'),
(16, 10, 'Prefiero la versión en vivo de Rock in Rio', '2024-05-17'),
(4, 10, 'Sobrevvalorada! Prefiero Run to the Hills', '2024-07-03'),
(13, 10, 'Bruce Dickinson corriendo en el escenario >>>', '2023-09-18'),
(9, 12, 'Esta versión en vivo es superior a la de estudio', '2023-07-25'),
(4, 12, 'Canción perfecta para días difíciles', '2025-01-04'),
(1, 12, 'La versión acústica es aún mejor', '2025-05-12'),
(10, 12, 'Canción perfecta para limpiar la casa', '2024-04-22'),
(8, 15, 'Riff más reconocible del metal', '2023-09-11'),
(12, 15, 'Sobreexplotada pero nunca aburrida', '2024-02-29'),
(7, 15, 'La tocaron hasta el cansancio en los 90', '2023-11-11'),
(14, 15, 'El solo es simple pero efectivo', '2024-10-31'),
(1, 17, 'Madonna revolucionó el pop con esto', '2025-04-12'),
(14, 17, 'No es su mejor canción pero sí la más icónica', '2024-07-19'),
(3, 17, 'Innovadora para su época, ahora suena dated', '2025-01-15'),
(11, 17, 'Madonna sabía cómo provocar y vender', '2023-06-30'),
(6, 19, 'Marc y La India eran fuego puro juntos', '2023-12-03'),
(10, 19, 'Este tema nunca falla en las fiestas', '2024-08-21'),
(9, 19, 'ESTA SÍ ES SALSA DE VERDAD!', '2024-09-05'),
(16, 19, 'Marc Anthony antes de volverse comercial', '2025-03-08'),
(16, 20, 'Material Girl envejeció mejor de lo que esperaba', '2025-06-20'),
(13, 21, 'Dolly escribió esto en una servilleta, qué talento!', '2025-05-30'),
(15, 21, 'La versión de Miley Cyrus también es buena', '2024-04-01'),
(2, 21, 'Dolly merece más respeto en la industria', '2024-02-14'),
(6, 21, 'La samplearon en como 50 canciones de rap', '2023-10-10'),
(2, 23, 'Himno eterno del deporte mundial', '2023-06-10'),
(7, 23, 'Simple pero efectivo, Brian May es un crack', '2025-06-15'),
(4, 23, '5 notas y crearon un himno... genios', '2025-04-18'),
(13, 23, 'Brian May usó una moneda en lugar de púa!', '2024-07-07'),
(3, 24, 'Cómo hacía para inclinarse así??', '2024-09-14'),
(9, 24, 'El bassline de esta canción es criminalmente bueno', '2023-08-27'),
(5, 24, 'Alguien sabe qué significa "Annie are you ok?"', '2023-08-08'),
(12, 24, 'El moonwalk > cualquier baile moderno', '2025-06-01'),
(5, 25, 'La canción más personal de Marley', '2025-02-18'),
(11, 25, 'Ojalá más gente escuchara el mensaje de esta obra', '2024-10-05');

--Calificaciones

--Letras

--Insert contenido por playlist

INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido)
VALUES
-- Clásicos del Rock
(1, 1),
(1, 2), 
(1, 3),  
(1, 4), 
(1, 5),
(1, 6),
(1, 7),
(1, 8),
-- Pop Hits 
(2, 4),  
(2, 5), 
(2, 6),  
(2, 20),  
(2, 21),  
-- Jazz para Relajarse 
(3, 9),  
(3, 10),  
-- Hip Hop Essentials
(4, 24),  
-- Éxitos de Salsa 
(5, 22), 
(5, 23),  
-- Metal Pesado
(6, 11),  
(6, 12), 
(6, 13), 
(6, 17),  
(6, 18),  
(6, 19),
-- Country Road Trip 
(7, 24), 
(7, 25), 
-- Electrónica para Bailar 
(8, 8), 
-- Reggae Vibes
(9, 14), 
(9, 15),  
(9, 16);

--insert contenido por interprete

INSERT INTO ContenidoInterprete (IdContenido, IdInterprete)
VALUES
-- Queen
(1, 1),  
(2, 1), 
(3, 1),  
(4, 1),  
-- Michael
(5, 3), 
(6, 3),  
(7, 3),  
(8, 3),  
-- Miles Davis Quintet 
(9, 6), 
(10, 6), 
-- Maiden 
(11, 20), 
(12, 20), 
(13, 20), 
-- Bob Marley
(14, 13),
(15, 13),
(16, 13),
-- Metallica
(17, 19),
(18, 19), 
(19, 19), 
--Madonna 
(20, 4), 
(21, 4),  
-- Marc Anthony 
(22, 15),
(23, 15), 
-- Dolly Parton 
(24, 18), 
(25, 18);

--Insert historial de reproduccion

INSERT INTO HistorialReproduccion (IdUsuario, IdContenido, FechaReproduccion, TiempoReproduccion)
VALUES

(1, 16, '2024-04-22', 150),
(1, 6, '2024-02-14', 150), 
(2, 15, '2024-08-03', 181),
(2, 7, '2023-12-31', 120), 
(2, 5, '2024-08-19', 200),
(3, 4, '2025-01-10', 80), 
(3, 21, '2024-09-15', 200),
(3, 25, '2023-08-15', 100),
(4, 11, '2025-05-12', 251),
(4, 10, '2024-03-30', 100), 
(4, 25, '2024-05-18', 200), 
(5, 1, '2024-03-15', 354), 
(5, 22, '2024-10-12', 328), 
(5, 23, '2024-07-07', 250),
(6, 17, '2025-03-08', 331),  
(6, 3, '2024-02-14', 218), 
(7, 24, '2024-01-07', 162),
(7, 9, '2023-11-15', 400),
(7, 12, '2024-10-08', 228),
(7, 12, '2024-10-08', 228),
(8, 5, '2023-10-31', 357),
(8, 20, '2025-01-01', 238),
(9, 14, '2023-12-25', 428), 
(9, 1, '2025-01-05', 180),
(10, 10, '2024-04-05', 338), 
(10, 23, '2025-04-05', 150),
(10, 17, '2024-11-11', 331),
(11, 20, '2025-02-14', 238), 
(11, 9, '2025-04-18', 500), 
(11, 24, '2025-03-12', 162),  
(12, 2, '2024-05-20', 120),
(12, 15, '2023-07-21', 181),
(13, 13, '2024-07-22', 100),
(13, 19, '2025-02-28', 300),
(14, 18, '2024-09-11', 200),
(14, 6, '2024-06-25', 294),
(14, 18, '2023-09-05', 388),
(15, 8, '2024-06-18', 258), 
(15, 22, '2023-10-15', 328), 
(16, 21, '2023-07-30', 50), 
(16, 13, '2025-05-20', 231);

