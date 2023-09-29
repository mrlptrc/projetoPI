CREATE TABLE `Cliente` (
  `ID` INT PRIMARY KEY,
  `Nome` VARCHAR(255),
  `Endereco` VARCHAR(255),
  `Numero_de_telefone` VARCHAR(15),
  `Email` VARCHAR(255)
);

CREATE TABLE `Pedido` (
  `ID` INT PRIMARY KEY,
  `Data_e_hora_do_pedido` DATETIME,
  `Status_do_pedido` VARCHAR(50),
  `Total_do_pedido` DECIMAL(10,2),
  `ID_do_Cliente` INT
);

CREATE TABLE `Pizza` (
  `ID` INT PRIMARY KEY,
  `Nome_da_pizza` VARCHAR(255),
  `Preco` DECIMAL(10,2)
);

CREATE TABLE `Ingrediente` (
  `ID` INT PRIMARY KEY,
  `Nome_do_ingrediente` VARCHAR(255),
  `Preco_do_ingrediente` DECIMAL(10,2)
);

CREATE TABLE `Entregador` (
  `ID` INT PRIMARY KEY,
  `Nome_do_entregador` VARCHAR(255),
  `Numero_de_telefone_do_entregador` VARCHAR(15)
);

CREATE TABLE `Endereco_de_Entrega` (
  `ID` INT PRIMARY KEY,
  `Endereco_de_entrega` VARCHAR(255),
  `ID_do_Cliente` INT
);

CREATE TABLE `Pagamento` (
  `ID` INT PRIMARY KEY,
  `Metodo_de_pagamento` VARCHAR(50),
  `ID_do_Pedido` INT,
  `Total_pago` DECIMAL(10,2)
);

CREATE TABLE `Pedido_Pizza` (
  `ID` INT PRIMARY KEY,
  `ID_do_Pedido` INT,
  `ID_da_Pizza` INT
);

CREATE TABLE `Pizza_Ingrediente` (
  `ID` INT PRIMARY KEY,
  `ID_da_Pizza` INT,
  `ID_do_Ingrediente` INT
);

ALTER TABLE `Pedido` ADD FOREIGN KEY (`ID_do_Cliente`) REFERENCES `Cliente` (`ID`);

ALTER TABLE `Endereco_de_Entrega` ADD FOREIGN KEY (`ID_do_Cliente`) REFERENCES `Cliente` (`ID`);

ALTER TABLE `Pagamento` ADD FOREIGN KEY (`ID_do_Pedido`) REFERENCES `Pedido` (`ID`);

ALTER TABLE `Pedido_Pizza` ADD FOREIGN KEY (`ID_do_Pedido`) REFERENCES `Pedido` (`ID`);

ALTER TABLE `Pedido_Pizza` ADD FOREIGN KEY (`ID_da_Pizza`) REFERENCES `Pizza` (`ID`);

ALTER TABLE `Pizza_Ingrediente` ADD FOREIGN KEY (`ID_da_Pizza`) REFERENCES `Pizza` (`ID`);

ALTER TABLE `Pizza_Ingrediente` ADD FOREIGN KEY (`ID_do_Ingrediente`) REFERENCES `Ingrediente` (`ID`);
