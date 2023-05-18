<?php
require 'config.php';
?>

<table border="0" width="100%">
    <tr>
        <th>Nome do Banco</th>
        <th>Verba</th>
        <th>Codigo do contrato</th>
        <th>Data de inclusao</th>
        <th>Valor</th>
        <th> Prazo </th>
    </tr>
    <?php
    $sql = "SELECT b.nome, c.verba, ctt.codigo, ctt.data_inclusao, ctt.valor, ctt.prazo FROM tb_banco b
            JOIN tb_convenio c ON b.codigo = c.banco
            JOIN tb_convenio_servico cs ON c.codigo = cs.convenio
            JOIN tb_contrato ctt ON cs.codigo = ctt.convenio_servico";
    $sql = $pdo->query($sql);
    if ($sql->rowCount() > 0){
        foreach ($sql->fetchAll() as $c) {
            echo '<tr>';
                echo '<td align="center">'.$c['nome'].'</td>';
                echo '<td align="center">'.$c['verba'].'</td>';
                echo '<td align="center">'.$c['codigo'].'</td>';
                echo '<td align="center">'.$c['data_inclusao'].'</td>';
                echo '<td align="center">'.$c['valor'].'</td>';
                echo '<td align="center">'.$c['prazo'].'</td>';
            echo '</tr>';
        }
    }
    ?>
</table>
