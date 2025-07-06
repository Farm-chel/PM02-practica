CREATE TABLE ��������������������������� (
    id_��������� INT PRIMARY KEY IDENTITY(1,1),
    ��������_��������� NVARCHAR(50) NOT NULL,
    �������� NVARCHAR(MAX),
    ���_����� NVARCHAR(10)
);

-- ������� ������� �������
CREATE TABLE ������������� (
    id_������ INT PRIMARY KEY IDENTITY(1,1),
    �������� NVARCHAR(50) NOT NULL,
    ����� NVARCHAR(MAX) NOT NULL,
    ���_������ NVARCHAR(20) NOT NULL,
    ������������� NVARCHAR(100) NOT NULL,
    ������� NVARCHAR(20) NOT NULL
);

-- ������� ����� ��� ������
CREATE TABLE �������������� (
    id_��������� INT PRIMARY KEY IDENTITY(1,1),
    ������������ NVARCHAR(100) NOT NULL,
    �������_��������� NVARCHAR(20) NOT NULL,
    �������_������� DECIMAL(10,2) DEFAULT 0,
    �����������_����� DECIMAL(10,2) DEFAULT 0,
    �����_�������_��_1000_�������� DECIMAL(10,4)
);

-- ������� ��������������� �����
CREATE TABLE �������������������� (
    id_����� INT PRIMARY KEY IDENTITY(1,1),
    �������� NVARCHAR(50) NOT NULL,
    ���_����� NVARCHAR(30) NOT NULL,
    ������������������_�_����� INT NOT NULL,
    ����_����������_�� DATE
);

-- ������� ������������
CREATE TABLE ����������� (
    id_����������� INT PRIMARY KEY IDENTITY(1,1),
    ������������ NVARCHAR(150) NOT NULL,
    ������_������������ NVARCHAR(250),
    ��� NVARCHAR(12) UNIQUE,
    ��� NVARCHAR(9),
    ��_����� NVARCHAR(MAX),
    ����_����� NVARCHAR(MAX),
    ������� NVARCHAR(20),
    email NVARCHAR(100),
    id_���������_��������� INT,
    ���_����������� NVARCHAR(30) NOT NULL,
    ���������� INT CHECK (���������� BETWEEN 1 AND 100),
    FOREIGN KEY (id_���������_���������) REFERENCES ����������(id_����������)
);

-- ������� �������������
CREATE TABLE ������������� (
    id_������������� INT PRIMARY KEY IDENTITY(1,1),
    �������� NVARCHAR(50) NOT NULL,
    id_������������ INT,
    �������_���������� NVARCHAR(10),
    ���� INT,
    FOREIGN KEY (id_������������) REFERENCES ����������(id_����������)
);

-- ������� ����������
CREATE TABLE ��������� (
    id_��������� INT PRIMARY KEY IDENTITY(1,1),
    ������������ NVARCHAR(50) NOT NULL,
    id_������������� INT,
    �����_����������� DECIMAL(10,2),
    ����������� NVARCHAR(MAX),
    FOREIGN KEY (id_�������������) REFERENCES �������������(id_�������������)
);

-- ������� �����������
CREATE TABLE ���������� (
    id_���������� INT PRIMARY KEY IDENTITY(1,1),
    ��� NVARCHAR(100) NOT NULL,
    ����_�������� DATE,
    ��� NVARCHAR(10) CHECK (��� IN ('�������', '�������')),
    id_��������� INT NOT NULL,
    id_������������� INT NOT NULL,
    ����_������ DATE NOT NULL,
    ����_���������� DATE,
    ���������_����� NVARCHAR(10) UNIQUE,
    ������� NVARCHAR(20),
    email NVARCHAR(100),
    ��� NVARCHAR(12),
    ����� NVARCHAR(14),
    ������ DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_���������) REFERENCES ���������(id_���������),
    FOREIGN KEY (id_�������������) REFERENCES �������������(id_�������������)
);

-- �������������� ������� ��� �������� ��������� �����������
CREATE TABLE ���������������� (
    id_�������� INT PRIMARY KEY IDENTITY(1,1),
    id_���������� INT NOT NULL,
    �����_�������� NVARCHAR(50) NOT NULL,
    ����_�������� DATE NOT NULL,
    ����_������ DATE NOT NULL,
    ����_��������� DATE,
    FOREIGN KEY (id_����������) REFERENCES ����������(id_����������)
);

-- �������������� ������� ��� ����������� �����������
CREATE TABLE ���������������������� (
    id_������ INT PRIMARY KEY IDENTITY(1,1),
    id_���������� INT NOT NULL,
    �������_��������� NVARCHAR(150) NOT NULL,
    ���_��������� INT NOT NULL,
    ������������� NVARCHAR(100) NOT NULL,
    FOREIGN KEY (id_����������) REFERENCES ����������(id_����������)
);
ALTER TABLE �����������
ADD CONSTRAINT FK_�����������_����������
FOREIGN KEY (id_���������_���������) REFERENCES ����������(id_����������);