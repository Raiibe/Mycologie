<?php

namespace App\Utils;
use chillerlan\QRCode\QRCode;
/**
 * Paginator.php
 *
 * Get vars in configuration files
 *
 * @package    Utils
 * @author     WILMOUTH Steven
 * @version    1
 */
class QRCodeGenerator
{

    /**
     * Get var in configuration file
     * @param string $var Configuration name and var name (config.var)
     * @return string
     */
    public static function get($url, $data)
    {
        return (new QRCode)->render($url . $data);
    }

}