-- ============================================
-- SCRIPT DE INSERCIÓN DE DATOS DE EJEMPLO
-- Sistema JADE DETECT - PostgreSQL 17
-- ============================================

-- Limpiar datos existentes (opcional)
-- TRUNCATE TABLE detected_objects CASCADE;
-- TRUNCATE TABLE detections CASCADE;
-- TRUNCATE TABLE alert CASCADE;
-- TRUNCATE TABLE devices CASCADE;

-- ============================================
-- 1. INSERCIÓN DE DISPOSITIVOS
-- ============================================

INSERT INTO devices (name, type, location, status) VALUES
-- Cámaras de seguridad
('CAM-ENTRADA-01', 'CAMERA', 'Entrada Principal - Planta Baja', 'INACTIVE'),
('CAM-PARKING-02', 'CAMERA', 'Estacionamiento - Zona A', 'INACTIVE'),
('CAM-OFICINA-03', 'CAMERA', 'Oficinas - Segundo Piso', 'INACTIVE'),
('CAM-ALMACEN-04', 'CAMERA', 'Almacén - Zona de Carga', 'INACTIVE'),
('CAM-PERIMETRO-05', 'CAMERA', 'Perímetro Norte', 'INACTIVE'),

-- Sensores IoT
('SENSOR-TEMP-01', 'SENSOR', 'Sala de Servidores', 'ACTIVE'),
('SENSOR-MOV-02', 'SENSOR', 'Pasillo Principal', 'ACTIVE'),
('SENSOR-HUMO-03', 'SENSOR', 'Cocina - Cafetería', 'INACTIVE'),

-- Detectores especializados
('DETECTOR-METAL-01', 'DETECTOR', 'Entrada de Seguridad', 'ACTIVE'),
('DETECTOR-FUEGO-02', 'DETECTOR', 'Almacén de Químicos', 'ACTIVE');

-- ============================================
-- 2. INSERCIÓN DE ALERTAS
-- ============================================

INSERT INTO alert (message, level, status, timestamp) VALUES
-- Alertas altas
('Intrusión detectada en zona restringida', 'alta', 'PENDING', '2025-05-30 14:30:25'),
('Temperatura crítica en sala de servidores', 'alta', 'RESOLVED', '2025-05-30 10:15:10'),
('Detector de humo activado en cafetería', 'alta', 'RESOLVED', '2025-05-29 16:45:30'),
('Acceso no autorizado detectado', 'alta', 'PENDING', '2025-05-31 08:15:45'),

-- Alertas medias
('Movimiento no autorizado detectado', 'media', 'PENDING', '2025-05-30 22:10:45'),
('Cámara CAM-OFICINA-03 desconectada', 'media', 'PENDING', '2025-05-30 09:20:15'),
('Temperatura elevada en almacén', 'media', 'RESOLVED', '2025-05-29 14:30:20'),
('Dispositivo sin respuesta por 5 minutos', 'media', 'RESOLVED', '2025-05-31 11:45:30'),

-- Alertas bajas
('Batería baja en SENSOR-MOV-02', 'baja', 'RESOLVED', '2025-05-29 08:30:00'),
('Sistema de respaldo activado correctamente', 'baja', 'RESOLVED', '2025-05-29 02:00:00'),
('Mantenimiento programado completado', 'baja', 'RESOLVED', '2025-05-28 18:15:30'),
('Nueva detección de vehículo en parking', 'baja', 'RESOLVED', '2025-05-30 13:25:10'),
('Acceso autorizado registrado', 'baja', 'RESOLVED', '2025-05-30 08:45:20'),
('Actualización de firmware completada', 'baja', 'RESOLVED', '2025-05-31 07:20:15');

-- ============================================
-- 3. INSERCIÓN DE DETECCIONES
-- ============================================

INSERT INTO detections (date, device_id) VALUES
-- Detecciones de hoy (2025-05-30)
('2025-05-30 14:30:25', 1), -- CAM-ENTRADA-01
('2025-05-30 22:10:45', 2), -- CAM-PARKING-02
('2025-05-30 13:25:10', 2), -- CAM-PARKING-02
('2025-05-30 08:45:20', 1), -- CAM-ENTRADA-01
('2025-05-30 16:15:30', 4), -- CAM-ALMACEN-04

-- Detecciones de ayer (2025-05-29)
('2025-05-29 09:20:15', 5), -- CAM-PERIMETRO-05
('2025-05-29 11:45:00', 1), -- CAM-ENTRADA-01
('2025-05-29 14:30:25', 2), -- CAM-PARKING-02
('2025-05-29 17:10:45', 4), -- CAM-ALMACEN-04
('2025-05-29 19:25:10', 5), -- CAM-PERIMETRO-05

-- Detecciones anteriores (2025-05-28, 2025-05-27)
('2025-05-28 10:15:30', 1), -- CAM-ENTRADA-01
('2025-05-28 15:45:20', 2), -- CAM-PARKING-02
('2025-05-28 18:30:15', 4), -- CAM-ALMACEN-04
('2025-05-27 12:20:45', 1), -- CAM-ENTRADA-01
('2025-05-27 16:40:30', 5); -- CAM-PERIMETRO-05

-- ============================================
-- 4. INSERCIÓN DE OBJETOS DETECTADOS
-- ============================================

INSERT INTO detected_objects (detection_id, label, confidence, x1, y1, x2, y2) VALUES
-- Detección 1: Persona no autorizada en entrada
(1, 'person', 0.95, 150, 200, 300, 450),
(1, 'backpack', 0.78, 180, 320, 220, 380),

-- Detección 2: Vehículo sospechoso en parking
(2, 'car', 0.92, 400, 300, 650, 500),
(2, 'person', 0.87, 480, 250, 520, 350),
(2, 'license_plate', 0.65, 520, 420, 580, 450),

-- Detección 3: Vehículo normal en parking
(3, 'car', 0.96, 200, 250, 450, 400),
(3, 'person', 0.91, 350, 200, 380, 280),

-- Detección 4: Acceso autorizado
(4, 'person', 0.98, 320, 180, 420, 480),
(4, 'id_card', 0.82, 340, 300, 370, 330),

-- Detección 5: Actividad en almacén
(5, 'person', 0.89, 250, 150, 350, 400),
(5, 'forklift', 0.94, 100, 200, 200, 350),
(5, 'box', 0.75, 450, 300, 500, 350),
(5, 'box', 0.72, 460, 250, 510, 300),

-- Detección 6: Perímetro - Animal
(6, 'cat', 0.85, 180, 320, 220, 380),

-- Detección 7: Entrada - Empleado
(7, 'person', 0.96, 280, 160, 380, 460),
(7, 'coffee_cup', 0.68, 290, 280, 320, 320),

-- Detección 8: Parking - Múltiples vehículos
(8, 'car', 0.94, 150, 200, 350, 380),
(8, 'car', 0.91, 400, 180, 600, 360),
(8, 'person', 0.88, 320, 150, 360, 250),

-- Detección 9: Almacén - Carga de mercancía
(9, 'truck', 0.97, 50, 100, 400, 300),
(9, 'person', 0.93, 420, 180, 460, 320),
(9, 'person', 0.90, 350, 200, 390, 340),
(9, 'box', 0.86, 200, 250, 280, 320),

-- Detección 10: Perímetro nocturno
(10, 'person', 0.76, 200, 180, 280, 420),
(10, 'flashlight', 0.62, 240, 300, 260, 340),

-- Detección 11: Entrada matutina
(11, 'person', 0.97, 300, 170, 400, 470),
(11, 'briefcase', 0.81, 320, 350, 380, 400),

-- Detección 12: Parking diurno
(12, 'car', 0.93, 180, 220, 380, 400),
(12, 'bicycle', 0.79, 420, 280, 480, 360),

-- Detección 13: Almacén - Inventario
(13, 'person', 0.95, 220, 140, 320, 440),
(13, 'clipboard', 0.74, 250, 280, 290, 320),
(13, 'box', 0.88, 400, 300, 480, 380),

-- Detección 14: Entrada - Visitante
(14, 'person', 0.92, 290, 190, 390, 490),
(14, 'visitor_badge', 0.67, 310, 290, 340, 320),

-- Detección 15: Perímetro - Mantenimiento
(15, 'person', 0.94, 160, 160, 260, 460),
(15, 'toolbox', 0.83, 180, 380, 240, 420),
(15, 'ladder', 0.77, 300, 200, 340, 400);

-- ============================================
-- 5. INSERCIÓN DE USUARIOS
-- ============================================

INSERT INTO users (id, username, email, role) VALUES
('1ba68c71-10dd-455e-88fb-143f888ed0a1', 'daniel.nieto', 'danielnieto20@gmail.com', 'USER'),
('09d99899-7b3d-4cf0-b2d5-9bc5b6da1708', 'dylan.cadena', 'dilinpinguin@mail.com', 'USER'),
('7fa314ea-66c9-4523-949c-23be681136f3', 'victor.manuel', 'vicboss2002@gmail.com', 'ADMIN');
-- ============================================
-- CONSULTAS DE VERIFICACIÓN
-- ============================================

-- Verificar dispositivos insertados
-- SELECT id, name, type, location, status FROM devices ORDER BY id;

-- Verificar alertas por nivel
-- SELECT level, status, COUNT(*) as total FROM alert GROUP BY level, status ORDER BY level;

-- Verificar detecciones por dispositivo
-- SELECT d.name as device_name, COUNT(det.id) as total_detections 
-- FROM devices d 
-- LEFT JOIN detections det ON d.id = det.device_id 
-- GROUP BY d.id, d.name 
-- ORDER BY total_detections DESC;

-- Verificar objetos detectados más comunes
-- SELECT label, COUNT(*) as total, AVG(confidence) as avg_confidence 
-- FROM detected_objects 
-- GROUP BY label 
-- ORDER BY total DESC;

-- Ver detección completa con objetos
-- SELECT 
--    det.id as detection_id,
--    det.date,
--    dev.name as device_name,
--    obj.label,
--    obj.confidence,
--    CONCAT('(', obj.x1, ',', obj.y1, ')-(', obj.x2, ',', obj.y2, ')') as bbox
-- FROM detections det
-- JOIN devices dev ON det.device_id = dev.id
-- JOIN detected_objects obj ON det.id = obj.detection_id
-- ORDER BY det.date DESC, det.id, obj.id;