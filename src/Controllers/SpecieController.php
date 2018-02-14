<?php

namespace App\Controllers;

use App\Models\Specie;
use App\Utils\Session;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class SpecieController extends BaseController
{
    public function index(RequestInterface $request, ResponseInterface $response)
    {
        $species = Specie::get();

        $this->render($response, 'specie/index', [
            'species' => $species
        ]);
    }
}