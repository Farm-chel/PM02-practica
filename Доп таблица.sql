ALTER TABLE Пользователи ADD Email NVARCHAR(100) NULL;
CREATE TABLE LoginHistory (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NULL,
    UserName NVARCHAR(100) NOT NULL,
    LoginTime DATETIME NOT NULL,
    Success BIT NOT NULL,
    IPAddress NVARCHAR(50) NULL,
    DeviceInfo NVARCHAR(255) NULL,
    FOREIGN KEY (UserID) REFERENCES Пользователи(id_пользователя)
);
INSERT INTO LoginHistory 
(UserID, UserName, LoginTime, Success, IPAddress, DeviceInfo)
VALUES
-- Успешные входы
(1, 'admin', DATEADD(day, -2, GETDATE()), 1, '192.168.1.100', 'Windows 10, Chrome'),
(1, 'admin', DATEADD(day, -1, GETDATE()), 1, '192.168.1.100', 'Windows 10, Firefox'),
(1, 'admin', GETDATE(), 1, '192.168.1.101', 'Windows 11, Chrome'),

-- Неудачные попытки
(NULL, 'hacker', DATEADD(hour, -5, GETDATE()), 0, '93.184.1.1', 'Linux, Curl'),
(NULL, 'unknown', DATEADD(hour, -3, GETDATE()), 0, '203.0.113.42', 'iOS, Safari'),

-- Входы других пользователей
(2, 'manager1', DATEADD(day, -1, GETDATE()), 1, '192.168.1.50', 'macOS, Safari'),
(3, 'accountant', DATEADD(hour, -12, GETDATE()), 1, '192.168.2.10', 'Windows 10, Edge'),
(2, 'manager1', GETDATE(), 0, '192.168.1.50', 'macOS, Safari - неверный пароль');