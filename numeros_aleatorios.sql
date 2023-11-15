-- Eliminar la tabla si ya existe (opcional)
DROP TABLE IF EXISTS numeros_aleatorios;

-- Crear una nueva tabla llamada "numeros_aleatorios"
CREATE TABLE numeros_aleatorios (
    id serial PRIMARY KEY,
    numero_aleatorio real
);

-- Crear una función que inserta 10 números aleatorios en la tabla
CREATE OR REPLACE FUNCTION insertar_numeros()
RETURNS VOID AS $$
DECLARE
    contador INT := 1;
BEGIN
    WHILE contador <= 10 LOOP
        INSERT INTO numeros_aleatorios (numero_aleatorio)
        VALUES (random() * 100); -- Genera números aleatorios entre 0 y 100
        contador := contador + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Llamar a la función para insertar los números aleatorios
SELECT insertar_numeros();

-- Consulta para verificar los números aleatorios
SELECT * FROM numeros_aleatorios;
