-- ============================================================
-- Script 03
-- Consultas básicas.
--
-- Clase 2 - Modelado de Datos y Lenguaje SQL
--
-- Este script cubre:
-- - SELECT
-- - WHERE
-- - ORDER BY
-- - LIMIT
-- - UPDATE
-- - DELETE
--
-- Importante:
-- En esta clase trabajamos consultas sobre una sola tabla.
-- Las consultas que combinan varias tablas con JOIN se verán
-- en la próxima clase.
-- ============================================================

-- ============================================================
-- 1. SELECT
-- Obtener columnas específicas de una tabla.
-- ============================================================

SELECT nombre, email
FROM usuarios;


SELECT nombre, fuente
FROM datasets;

SELECT nombre, tipo, version
FROM modelos;

-- ============================================================
-- 2. SELECT *
-- Obtener todas las columnas de una tabla.
-- ============================================================

SELECT *
FROM usuarios;

SELECT *
FROM datasets;

SELECT *
FROM experimentos;

-- ============================================================
-- 3. WHERE
-- Filtrar resultados.
-- ============================================================

-- Datasets provenientes de IoT.

SELECT *
FROM datasets
WHERE fuente = 'IoT';

-- Datasets con más de 10000 registros.

SELECT nombre, fuente, cantidad_registros
FROM datasets
WHERE cantidad_registros > 10000;

-- Modelos de clasificación.

SELECT nombre, tipo, version
FROM modelos
WHERE tipo = 'Clasificación';

-- Experimentos finalizados.

SELECT nombre, descripcion, finalizado
FROM experimentos
WHERE finalizado = TRUE;

-- Métricas de un experimento conocido.
-- Todavía no combinamos tablas: filtramos por el id del experimento.

SELECT nombre, valor
FROM metricas
WHERE experimento_id = 1;

-- ============================================================
-- 4. ORDER BY
-- Ordenar resultados.
-- ============================================================

-- Ordenar datasets por fecha de creación.

SELECT nombre, fecha_creacion
FROM datasets
ORDER BY fecha_creacion DESC;

-- Ordenar datasets por cantidad de registros.

SELECT nombre, cantidad_registros
FROM datasets
ORDER BY cantidad_registros DESC;

-- Ordenar métricas por valor.

SELECT nombre, valor
FROM metricas
WHERE experimento_id = 1
ORDER BY valor DESC;

-- ============================================================
-- 5. LIMIT
-- Limitar la cantidad de resultados.
-- ============================================================

-- Mostrar los últimos 2 datasets cargados.

SELECT *
FROM datasets
ORDER BY fecha_creacion DESC
LIMIT 2;

-- Mostrar los 2 datasets con mayor cantidad de registros.

SELECT nombre, cantidad_registros
FROM datasets
ORDER BY cantidad_registros DESC
LIMIT 2;

-- Mostrar las 3 métricas con mayor valor del experimento 1.

SELECT nombre, valor
FROM metricas
WHERE experimento_id = 1
ORDER BY valor DESC
LIMIT 3;

-- ============================================================
-- 6. UPDATE
-- Modificar registros existentes.
--
-- Importante:
-- WHERE indica qué registro se modifica.
-- Un UPDATE sin WHERE puede modificar toda la tabla.
-- ============================================================

-- Modificar la fuente del dataset con id = 1.

UPDATE datasets
SET fuente = 'Sensores IoT'
WHERE id = 1;

-- Verificar el cambio.

SELECT *
FROM datasets
WHERE id = 1;

-- Marcar un experimento como finalizado.

UPDATE experimentos
SET finalizado = TRUE
WHERE id = 3;

-- Verificar el cambio.

SELECT *
FROM experimentos
WHERE id = 3;

-- ============================================================
-- 7. DELETE
-- Eliminar registros.
--
-- Para no romper el caso principal, primero insertamos
-- un registro de prueba y después lo eliminamos.
-- ============================================================

-- Insertar un dataset temporal.

INSERT INTO datasets(usuario_id, nombre, fuente, cantidad_registros)
VALUES (1, 'Dataset temporal', 'Prueba', 10);

-- Verificar que se insertó.

SELECT *
FROM datasets
WHERE nombre = 'Dataset temporal';

-- Eliminar solo el dataset temporal.

DELETE FROM datasets
WHERE nombre = 'Dataset temporal';

-- Verificar que ya no está.

SELECT *
FROM datasets
WHERE nombre = 'Dataset temporal';

-- ============================================================
-- 8. Advertencia didáctica
--
-- Los siguientes comandos NO se ejecutan.
-- Sirven para conversar en clase.
-- ============================================================

-- UPDATE datasets
-- SET fuente = 'Fuente modificada';

-- DELETE FROM datasets;