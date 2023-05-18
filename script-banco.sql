--
-- Banco de dados: `facil-sol`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_banco`
--

CREATE TABLE `tb_banco` (
                            `codigo` int(11) NOT NULL,
                            `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_banco`
--

INSERT INTO `tb_banco` (`codigo`, `nome`) VALUES
                                              (1, 'Bradesco'),
                                              (2, 'Banco do Brasil');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contrato`
--

CREATE TABLE `tb_contrato` (
                               `codigo` int(11) NOT NULL,
                               `prazo` int(11) NOT NULL,
                               `valor` int(11) NOT NULL,
                               `data_inclusao` date NOT NULL,
                               `convenio_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_contrato`
--

INSERT INTO `tb_contrato` (`codigo`, `prazo`, `valor`, `data_inclusao`, `convenio_servico`) VALUES
                                                                                                (3, 3, 2100, '2023-05-18', 1),
                                                                                                (4, 6, 3300, '2023-05-19', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_convenio`
--

CREATE TABLE `tb_convenio` (
                               `codigo` int(11) NOT NULL,
                               `convenio` varchar(20) NOT NULL,
                               `verba` bigint(20) NOT NULL,
                               `banco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_convenio`
--

INSERT INTO `tb_convenio` (`codigo`, `convenio`, `verba`, `banco`) VALUES
                                                                       (1, 'Unimed', 200000, 1),
                                                                       (2, 'Hapvida', 315000, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_convenio_servico`
--

CREATE TABLE `tb_convenio_servico` (
                                       `codigo` int(11) NOT NULL,
                                       `convenio` int(11) NOT NULL,
                                       `servico` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_convenio_servico`
--

INSERT INTO `tb_convenio_servico` (`codigo`, `convenio`, `servico`) VALUES
                                                                        (1, 1, 'Ambulatorial'),
                                                                        (2, 2, 'CTI');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_banco`
--
ALTER TABLE `tb_banco`
    ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
    ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_convenio_servico` (`convenio_servico`);

--
-- Índices de tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
    ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_banco` (`banco`);

--
-- Índices de tabela `tb_convenio_servico`
--
ALTER TABLE `tb_convenio_servico`
    ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_convenio` (`convenio`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_banco`
--
ALTER TABLE `tb_banco`
    MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
    MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
    MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_contrato`
--
ALTER TABLE `tb_contrato`
    ADD CONSTRAINT `fk_convenio_servico` FOREIGN KEY (`convenio_servico`) REFERENCES `tb_convenio_servico` (`codigo`);

--
-- Restrições para tabelas `tb_convenio`
--
ALTER TABLE `tb_convenio`
    ADD CONSTRAINT `fk_banco` FOREIGN KEY (`banco`) REFERENCES `tb_banco` (`codigo`);

--
-- Restrições para tabelas `tb_convenio_servico`
--
ALTER TABLE `tb_convenio_servico`
    ADD CONSTRAINT `fk_convenio` FOREIGN KEY (`convenio`) REFERENCES `tb_convenio` (`codigo`);
COMMIT;