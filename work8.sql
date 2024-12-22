CREATE TABLE IF NOT EXISTS Врачи (
    ID_врач SERIAL PRIMARY KEY,
    Фамилия VARCHAR(50) NOT NULL,
    Имя VARCHAR(50) NOT NULL,
    Отчество VARCHAR(50) NOT NULL,
    Почта_Рабочая VARCHAR(100) NOT NULL UNIQUE,
    Стоимость_приема NUMERIC(10, 2) NOT NULL,
    Процент_отчисления_на_зарплату NUMERIC(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Пациенты (
    ID_пациент SERIAL PRIMARY KEY,
    Фамилия VARCHAR(50) NOT NULL,
    Имя VARCHAR(50) NOT NULL,
    Отчество VARCHAR(50) NOT NULL,
    Телефон VARCHAR(15) NOT NULL UNIQUE,
    Дата_Рождения DATE NOT NULL,
    Адрес_Пациента VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS Специальность (
    ID_специальность SERIAL PRIMARY KEY,
    Название_Специальности VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Специализация_Врача (
    ID_врач_спец SERIAL PRIMARY KEY,
    ID_врач INT NOT NULL,
    ID_специальность INT NOT NULL,
    FOREIGN KEY (ID_врач) REFERENCES Врачи(ID_врач),
    FOREIGN KEY (ID_специальность) REFERENCES Специальность(ID_специальность)
);

CREATE TABLE IF NOT EXISTS Приемы (
    ID_прием SERIAL PRIMARY KEY,
    Дата_приема TIMESTAMP NOT NULL,
    ID_врач INT NOT NULL,
    ID_пациент INT NOT NULL,
    FOREIGN KEY (ID_врач) REFERENCES Врачи(ID_врач),
    FOREIGN KEY (ID_пациент) REFERENCES Пациенты(ID_пациент)
);

CREATE TABLE IF NOT EXISTS Квитанция_об_оплате (
    ID_квитанция SERIAL PRIMARY KEY,
    Способ_оплаты VARCHAR(50) NOT NULL,
    ID_прием INT NOT NULL,
    FOREIGN KEY (ID_прием) REFERENCES Приемы(ID_прием)
);

CREATE TABLE IF NOT EXISTS Зарплата_Врача (
    ID_зарплата SERIAL PRIMARY KEY,
    Год INT NOT NULL,
    Месяц INT NOT NULL,
    Зарплата_За_Месяц NUMERIC(10, 2) NOT NULL,
    ID_врач INT NOT NULL,
    FOREIGN KEY (ID_врач) REFERENCES Врачи(ID_врач)
);