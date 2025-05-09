CREATE TABLE paciente (
    id SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    endereco_completo TEXT NOT NULL,
    codigo_pronto VARCHAR(50) UNIQUE NOT NULL,
    codigo_cns VARCHAR(20) UNIQUE NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    data_nascimento DATE NOT NULL
);

CREATE TABLE medico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(100)
);

CREATE TABLE nome_medicamentos (
    id SERIAL PRIMARY KEY,
    nome_comercial VARCHAR(150) NOT NULL,
    principio_ativo VARCHAR(150),
    para_que_serve VARCHAR(255)
);

CREATE TABLE cid (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE receita (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER NOT NULL REFERENCES paciente(id) ON DELETE CASCADE,
    medico_id INTEGER NOT NULL REFERENCES medico(id) ON DELETE SET NULL,
    cid_id INTEGER REFERENCES cid(id),
    data_emissao DATE NOT NULL DEFAULT CURRENT_DATE,
    observacoes TEXT
);

CREATE TABLE receita_medicamentos (
    id SERIAL PRIMARY KEY,
    receita_id INTEGER NOT NULL REFERENCES receita(id) ON DELETE CASCADE,
    medicamento_id INTEGER NOT NULL REFERENCES nome_medicamentos(id),
    dosagem VARCHAR(100),
    quantidade INTEGER,
    instrucoes TEXT
);

INSERT INTO paciente (nome_completo, endereco_completo, codigo_pronto, codigo_cns, sexo, data_nascimento) VALUES
('Ana Beatriz da Silva', 'Rua das Flores, 123 - Centro, São Paulo - SP', 'X2F9T6LM3JZ1RQ0A7B8YCN4D5EVWGH', '123456789000001', 'F', '1985-04-12'),
('Carlos Eduardo Mendes', 'Av. Brasil, 456 - Jardim América, Rio de Janeiro - RJ', 'N8B6ZQ7MCAPV1X3T4L9FY0EWJRDGHK', '123456789000002', 'M', '1979-11-30'),
('Fernanda Oliveira Santos', 'Rua Amapá, 77 - Bairro Industrial, Belo Horizonte - MG', 'K4T7R2WGHZLY3FVCJX0A89N5D1BMPE', '123456789000003', 'F', '1992-07-20'),
('Lucas Pereira Rocha', 'Rua do Sol, 89 - Centro, Salvador - BA', 'M5VZBCQ0W1AY8RJ3XN2TDKLF9EG7PH', '123456789000004', 'M', '1990-01-15'),
('Mariana Costa Lima', 'Av. das Palmeiras, 1000 - Zona Sul, Curitiba - PR', 'FZ0V7PML9Q3CGAXY5BRWDTKNE281HJ', '123456789000005', 'F', '1988-10-10'),
('João Vitor Almeida', 'Rua Pedro Álvares, 45 - Vila Nova, Porto Alegre - RS', 'QAPX2JRW7M5LYTBGCE9NKD04VH31ZF', '123456789000006', 'M', '1982-03-05'),
('Camila Ribeiro Soares', 'Av. Central, 22 - Centro, Recife - PE', 'XYV5K0WT2RLJPNE9CM4AGD8FBZ731Q', '123456789000007', 'F', '1995-06-18'),
('Rafael Martins Lopes', 'Rua Independência, 304 - Bairro Novo, Fortaleza - CE', 'E3B1CN97XGZLFADYM2KPQJRTV860WH', '123456789000008', 'M', '1987-12-22'),
('Juliana Figueiredo', 'Rua Primavera, 99 - Vila Verde, Florianópolis - SC', 'PJWV8CAYTFX1KQNMRZB54L36DGE920', '123456789000009', 'F', '1991-09-03'),
('Thiago Souza Lima', 'Av. das Nações, 321 - Setor Oeste, Goiânia - GO', 'KNF9V2WTG5JX0ZMRCDPLQY8EAB137H', '123456789000010', 'M', '1984-02-27');

INSERT INTO medico (nome, crm, especialidade) VALUES
('Dr. Marcelo Tavares', 'CRM12345-SP', 'Cardiologia'),
('Dra. Renata Oliveira', 'CRM23456-RJ', 'Pediatria'),
('Dr. Roberto Nunes', 'CRM34567-MG', 'Ortopedia'),
('Dra. Carla Mendes', 'CRM45678-RS', 'Dermatologia'),
('Dr. Eduardo Fonseca', 'CRM56789-BA', 'Neurologia'),
('Dra. Marina Castro', 'CRM67890-PR', 'Ginecologia'),
('Dr. André Santos', 'CRM78901-PE', 'Psiquiatria'),
('Dra. Beatriz Lima', 'CRM89012-CE', 'Endocrinologia'),
('Dr. Fábio Almeida', 'CRM90123-SC', 'Oftalmologia'),
('Dra. Paula Reis', 'CRM01234-DF', 'Reumatologia');

INSERT INTO nome_medicamentos (nome_comercial, principio_ativo, para_que_serve) VALUES 
-- Bronquite e respiratórios
('Prednisona', 'Prednisona', 'Bronquite e inflamações'),
('Amoxicilina + Clavulanato de Potássio', 'Amoxicilina + Ácido Clavulânico', 'Infecções respiratórias e bronquite bacteriana'),
('Clenil A', 'Dipropionato de Beclometasona', 'Asma e bronquite'),
('Aerodini', 'Salbutamol', 'Crises de asma e broncoespasmos'),
('Salbutamol', 'Salbutamol', 'Bronquite e crises asmáticas'),

-- Hipertensão (pressão alta)
('Capoten', 'Captopril', 'Hipertensão arterial'),
('Renitec', 'Enalapril', 'Hipertensão e insuficiência cardíaca'),
('Tritace', 'Ramipril', 'Pressão alta e proteção cardiovascular'),
('Zestril', 'Lisinopril', 'Hipertensão e insuficiência cardíaca'),
('Cozaar', 'Losartana potássica', 'Hipertensão e proteção renal'),
('Diovan', 'Valsartana', 'Hipertensão arterial'),
('Atacand', 'Candesartana', 'Hipertensão e insuficiência cardíaca'),
('Aprovel', 'Irbesartana', 'Hipertensão e nefropatia diabética'),
('Tenormin', 'Atenolol', 'Hipertensão e arritmias'),
('Inderal', 'Propranolol', 'Hipertensão, enxaqueca e ansiedade'),
('Seloken', 'Metoprolol', 'Hipertensão e insuficiência cardíaca'),
('Carvedilol', 'Carvedilol', 'Hipertensão e insuficiência cardíaca'),
('Norvasc', 'Anlodipino', 'Hipertensão e angina'),
('Adalat', 'Nifedipino', 'Hipertensão e crises hipertensivas'),
('Isoptin', 'Verapamil', 'Hipertensão e arritmias'),
('Cardizem', 'Diltiazem', 'Hipertensão e angina'),
('Carduran', 'Mesilato de doxazosina', 'Hipertensão e hiperplasia prostática'),
('Minipress', 'Cloridrato de prazosina', 'Hipertensão'),
('Apresolina', 'Cloridrato de hidralazina', 'Hipertensão grave'),
('Loniten', 'Minoxidil', 'Hipertensão resistente'),
('Rasilez', 'Alisquireno', 'Hipertensão'),
('Clorana', 'Clortalidona', 'Hipertensão e retenção de líquidos'),
('Lasix', 'Furosemida', 'Hipertensão e edema'),
('Aldactone', 'Espironolactona', 'Hipertensão e insuficiência cardíaca'),
('Natrilix', 'Indapamida', 'Hipertensão'),
('Hidroclorotiazida', 'Hidroclorotiazida', 'Hipertensão e retenção de líquidos'),
('Lozart H', 'Losartana + Hidroclorotiazida', 'Hipertensão'),
('Enalapril H', 'Enalapril + Hidroclorotiazida', 'Hipertensão'),
('Exforge', 'Anlodipino + Valsartana', 'Hipertensão'),

-- Pré-diabetes
('Glifage', 'Metformina', 'Pré-diabetes e diabetes tipo 2'),
('Glucobay', 'Acarbose', 'Pré-diabetes e controle glicêmico'),
('Victoza', 'Liraglutida', 'Controle glicêmico e perda de peso'),
('Ozempic', 'Semaglutida', 'Controle glicêmico e perda de peso'),
('Actos', 'Pioglitazona', 'Controle da resistência à insulina'),
('Xenical', 'Orlistate', 'Controle de peso no pré-diabetes'),

-- Diabetes Tipo 1
('NovoRapid', 'Insulina Aspart', 'Diabetes tipo 1 e 2'),
('Humalog', 'Insulina Lispro', 'Diabetes tipo 1 e 2'),
('Apidra', 'Insulina Glulisina', 'Diabetes tipo 1 e 2'),
('Humulin N', 'Insulina NPH', 'Diabetes tipo 1 e 2'),
('Lantus', 'Insulina Glargina', 'Diabetes tipo 1 e 2'),
('Levemir', 'Insulina Detemir', 'Diabetes tipo 1 e 2'),
('Tresiba', 'Insulina Degludeca', 'Diabetes tipo 1 e 2'),

-- Diabetes Tipo 2
('Daonil', 'Glibenclamida', 'Diabetes tipo 2'),
('Diamicron', 'Gliclazida', 'Diabetes tipo 2'),
('Amaryl', 'Glimepirida', 'Diabetes tipo 2'),
('Januvia', 'Sitagliptina', 'Diabetes tipo 2'),
('Galvus', 'Vildagliptina', 'Diabetes tipo 2'),
('Onglyza', 'Saxagliptina', 'Diabetes tipo 2'),
('Tradjenta', 'Linagliptina', 'Diabetes tipo 2'),
('Jardiance', 'Empagliflozina', 'Diabetes tipo 2'),
('Forxiga', 'Dapagliflozina', 'Diabetes tipo 2'),
('Invokana', 'Canagliflozina', 'Diabetes tipo 2'),
('Byetta', 'Exenatida', 'Diabetes tipo 2'),
('Trulicity', 'Dulaglutida', 'Diabetes tipo 2'),

-- Diabetes Combinações
('Janumet', 'Sitagliptina + Metformina', 'Diabetes tipo 2'),
('Galvus Met', 'Vildagliptina + Metformina', 'Diabetes tipo 2'),
('Jardiance Duo', 'Empagliflozina + Metformina', 'Diabetes tipo 2'),
('Xigduo', 'Dapagliflozina + Metformina', 'Diabetes tipo 2'),

-- Depressão
('Prozac', 'Fluoxetina', 'Depressão'),
('Zoloft', 'Sertralina', 'Depressão'),
('Lexapro', 'Escitalopram', 'Depressão'),
('Cymbalta', 'Duloxetina', 'Depressão'),
('Efexor XR', 'Venlafaxina', 'Depressão'),
('Elavil', 'Amitriptilina', 'Depressão'),
('Paxil', 'Paroxetina', 'Depressão'),
('Wellbutrin', 'Bupropiona', 'Depressão'),
('Remeron', 'Mirtazapina', 'Depressão'),
('Trittico', 'Trazodona', 'Depressão');

INSERT INTO cid (codigo, descricao) VALUES
('J45', 'Asma'),
('I10', 'Hipertensão essencial (primária)'),
('I95', 'Hipotensão'),
('E10', 'Diabetes mellitus tipo 1'),
('E11', 'Diabetes mellitus tipo 2'),
('O24', 'Diabetes mellitus gestacional'),
('F32', 'Episódios depressivos'),
('F33', 'Transtorno depressivo recorrente');

INSERT INTO receita (paciente_id, medico_id, cid_id, data_emissao, observacoes) VALUES
(1, 2, 1, CURRENT_DATE, 'Paciente com diabetes tipo 1, início de controle glicêmico'),
(3, 1, 1, CURRENT_DATE, 'Hiperglicemia em jejum, ajustar insulina rápida'),
(4, 5, 1, CURRENT_DATE, 'Controle glicêmico instável, ajuste de dose'),
(2, 4, 1, CURRENT_DATE, 'Paciente com DM2, uso de insulina basal'),
(5, 3, 1, CURRENT_DATE, 'Paciente em uso contínuo de insulina de ação ultra longa'),
(1, 2, 2, CURRENT_DATE, 'Inflamação aguda, corticoide prescrito por 5 dias'),
(1, 2, 3, CURRENT_DATE, 'Infecção respiratória, antibiótico por 7 dias'),
(1, 2, 4, CURRENT_DATE, 'Crise de asma moderada, prescrito broncodilatador'),
(1, 2, 4, CURRENT_DATE, 'Controle de asma crônica, manutenção com corticosteroide inalatório'),
(1, 2, 4, CURRENT_DATE, 'Broncoespasmo eventual, uso conforme necessidade'),
(1, 2, 5, CURRENT_DATE, 'Controle de pressão arterial'),
(1, 2, 6, CURRENT_DATE, 'Tratamento para insuficiência adrenal'),
(1, 2, 6, CURRENT_DATE, 'Paciente com hipotensão ortostática, uso contínuo'),
(1, 2, 6, CURRENT_DATE, 'Adjuvante para fadiga e sonolência diurna'),
(1, 1, 1, CURRENT_DATE, 'Receita para tratamento de bronquite');


INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(1, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Lantus'), '10 unidades', 1, 'Aplicar à noite, via subcutânea');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(2, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'NovoRapid'), '5 unidades', 3, 'Aplicar antes das principais refeições');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(3, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Humalog'), '6 unidades', 2, 'Aplicar antes do café da manhã e jantar');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(4, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Levemir'), '12 unidades', 1, 'Aplicar à noite');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(5, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Tresiba'), '15 unidades', 1, 'Aplicar uma vez ao dia, sempre no mesmo horário');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(6, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Prednisona'), '20mg', 5, 'Tomar após o café da manhã');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(7, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Amoxicilina + Clavulanato de Potássio'), '500mg', 21, 'Tomar a cada 8 horas durante 7 dias');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(8, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Salbutamol'), '2 jatos', 6, 'Inalar a cada 4-6 horas em caso de dificuldade respiratória');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(9, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Clenil A'), '2 jatos', 2, 'Inalar pela manhã e à noite');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(10, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Aerodini'), '1 jato', 3, 'Inalar 3 vezes ao dia, conforme necessidade');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(11, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Tenormin'), '50mg', 30, 'Tomar 1 comprimido uma vez ao dia');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(12, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Florinef'), '0,1mg', 30, 'Tomar 1 comprimido por dia');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(13, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Midodrina'), '2,5mg', 90, 'Tomar 1 comprimido 3 vezes ao dia');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(14, (SELECT id FROM nome_medicamentos WHERE nome_comercial = 'Cafeína'), '100mg', 30, 'Tomar pela manhã');

INSERT INTO receita_medicamentos (receita_id, medicamento_id, dosagem, quantidade, instrucoes) VALUES
(15, 1, '10mg', 5, 'Tomar 1 comprimido por dia, de manhã'),
(15, 2, '500mg', 10, 'Tomar 1 comprimido a cada 12 horas por 7 dias'),
(15, 3, '200mcg', 6, 'Inalar 2 jatos pela manhã e à noite'),
(15, 4, '100mcg', 3, 'Inalar 2 jatos em caso de crise de asma'),
(15, 5, '200mcg', 6, 'Inalar 2 jatos conforme necessidade para crises asmáticas');
