<?php

namespace App\Controllers;

use App\Models\Specie;
use App\Utils\Paginator;
use App\Utils\Session;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class SpecieController extends BaseController
{
    public function index(RequestInterface $request, ResponseInterface $response)
    {
        $species = Specie::get();
        $perPage = 10;
        $offset = ($perPage * (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0));
        $total = count($species);
        $species = Specie::limit($perPage)
            ->offset($offset)
            ->get();

        $this->render($response, 'specie/index', [
            'species' => $species,
            'pagination' => Paginator::paginate($perPage, $total, $request->getParam('page'))
        ]);
    }
}