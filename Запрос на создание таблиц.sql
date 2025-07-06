CREATE TABLE КатегорииСпичечнойПродукции (
    id_категории INT PRIMARY KEY IDENTITY(1,1),
    название_категории NVARCHAR(50) NOT NULL,
    описание NVARCHAR(MAX),
    код_ТНВЭД NVARCHAR(10)
);

-- Таблица складов фабрики
CREATE TABLE СкладыФабрики (
    id_склада INT PRIMARY KEY IDENTITY(1,1),
    название NVARCHAR(50) NOT NULL,
    адрес NVARCHAR(MAX) NOT NULL,
    тип_склада NVARCHAR(20) NOT NULL,
    ответственный NVARCHAR(100) NOT NULL,
    телефон NVARCHAR(20) NOT NULL
);

-- Таблица сырья для спичек
CREATE TABLE СырьеДляСпичек (
    id_материала INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(100) NOT NULL,
    единица_измерения NVARCHAR(20) NOT NULL,
    текущий_остаток DECIMAL(10,2) DEFAULT 0,
    минимальный_запас DECIMAL(10,2) DEFAULT 0,
    норма_расхода_на_1000_коробков DECIMAL(10,4)
);

-- Таблица технологических линий
CREATE TABLE ТехнологическиеЛинии (
    id_линии INT PRIMARY KEY IDENTITY(1,1),
    название NVARCHAR(50) NOT NULL,
    тип_линии NVARCHAR(30) NOT NULL,
    производительность_в_смену INT NOT NULL,
    дата_последнего_ТО DATE
);

-- Таблица контрагентов
CREATE TABLE Контрагенты (
    id_контрагента INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(150) NOT NULL,
    полное_наименование NVARCHAR(250),
    ИНН NVARCHAR(12) UNIQUE,
    КПП NVARCHAR(9),
    юр_адрес NVARCHAR(MAX),
    факт_адрес NVARCHAR(MAX),
    телефон NVARCHAR(20),
    email NVARCHAR(100),
    id_основного_менеджера INT,
    тип_контрагента NVARCHAR(30) NOT NULL,
    надежность INT CHECK (надежность BETWEEN 1 AND 100),
    FOREIGN KEY (id_основного_менеджера) REFERENCES Сотрудники(id_сотрудника)
);

-- Таблица подразделений
CREATE TABLE Подразделения (
    id_подразделения INT PRIMARY KEY IDENTITY(1,1),
    название NVARCHAR(50) NOT NULL,
    id_руководителя INT,
    телефон_внутренний NVARCHAR(10),
    этаж INT,
    FOREIGN KEY (id_руководителя) REFERENCES Сотрудники(id_сотрудника)
);

-- Таблица должностей
CREATE TABLE Должности (
    id_должности INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(50) NOT NULL,
    id_подразделения INT,
    оклад_минимальный DECIMAL(10,2),
    обязанности NVARCHAR(MAX),
    FOREIGN KEY (id_подразделения) REFERENCES Подразделения(id_подразделения)
);

-- Таблица сотрудников
CREATE TABLE Сотрудники (
    id_сотрудника INT PRIMARY KEY IDENTITY(1,1),
    ФИО NVARCHAR(100) NOT NULL,
    дата_рождения DATE,
    пол NVARCHAR(10) CHECK (пол IN ('Мужской', 'Женский')),
    id_должности INT NOT NULL,
    id_подразделения INT NOT NULL,
    дата_приема DATE NOT NULL,
    дата_увольнения DATE,
    табельный_номер NVARCHAR(10) UNIQUE,
    телефон NVARCHAR(20),
    email NVARCHAR(100),
    ИНН NVARCHAR(12),
    СНИЛС NVARCHAR(14),
    ставка DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_должности) REFERENCES Должности(id_должности),
    FOREIGN KEY (id_подразделения) REFERENCES Подразделения(id_подразделения)
);

-- Дополнительная таблица для трудовых договоров сотрудников
CREATE TABLE ТрудовыеДоговоры (
    id_договора INT PRIMARY KEY IDENTITY(1,1),
    id_сотрудника INT NOT NULL,
    номер_договора NVARCHAR(50) NOT NULL,
    дата_договора DATE NOT NULL,
    дата_начала DATE NOT NULL,
    дата_окончания DATE,
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника)
);

-- Дополнительная таблица для образования сотрудников
CREATE TABLE ОбразованиеСотрудников (
    id_записи INT PRIMARY KEY IDENTITY(1,1),
    id_сотрудника INT NOT NULL,
    учебное_заведение NVARCHAR(150) NOT NULL,
    год_окончания INT NOT NULL,
    специальность NVARCHAR(100) NOT NULL,
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника)
);
ALTER TABLE Контрагенты
ADD CONSTRAINT FK_Контрагенты_Сотрудники
FOREIGN KEY (id_основного_менеджера) REFERENCES Сотрудники(id_сотрудника);