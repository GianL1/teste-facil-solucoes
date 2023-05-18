<?php
    $dsn ="mysql:dbname=facil-sol;host=localhost";
    $dbuser="root";
    $dbpass="";

    try {

        $pdo = new PDO($dsn, $dbuser, $dbpass);

    }catch (PDOException $exception) {
        echo "Falhou a conexão: ". $exception->getMessage();
    }