<?php

namespace App\Controllers;

use App\Utils\Picker;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class DatabaseController extends BaseController
{
    public function download(RequestInterface $request, ResponseInterface $response)
    {
        $conf = require(SRC . DS . 'Config' . DS . 'db.conf.php');
        $config = $conf[$conf['default']];

        $where = 'WHERE 1 ORDER BY 1';
        $hostname = $config['host'];
        $user = $config['user'];
        $password = $config['pass'];
        $database = $config['dbName'];
        $csv_filename = 'db_export_'.$database.'_'.date('Y-m-d').'.csv';
        $port = $config['port'];
        $conn = mysqli_connect($hostname, $user, $password, $database, $port);

        if (mysqli_connect_error()) {
            $this->flash('error', 'Failed to connect to MySQL: ' . mysqli_connect_error());
            return $this->redirect($response, 'index');
        } else {
            $query = mysqli_query($conn, "SHOW TABLES");
            $csv_export = '';
            $tablesList = array();

            while($cRow = mysqli_fetch_array($query))
            {
                $tablesList[] = $cRow[0];
            }

            foreach ($tablesList as $db_record) {
                $csv_export .= "Table des " . strtoupper($db_record) . "\n\n";
                $query = mysqli_query($conn, "SELECT * FROM " . $db_record . " " . $where);
                $field = mysqli_field_count($conn);

                for ($i = 0; $i < $field; $i++) {
                    $csv_export .= strtoupper(mysqli_fetch_field_direct($query, $i)->name) . ';';
                }

                $csv_export .= "\n";

                while ($row = mysqli_fetch_array($query)) {
                    for ($i = 0; $i < $field; $i++) {
                        $csv_export .= '"' . $row[mysqli_fetch_field_direct($query, $i)->name] . '";';
                    }
                    $csv_export .= "\n";
                }
                $csv_export .= "\n\n\n\n";
            }

            header("Content-type: text/x-csv");
            header("Content-Disposition: attachment; filename=" . $csv_filename . "");
            echo($csv_export);
        }
    }
}