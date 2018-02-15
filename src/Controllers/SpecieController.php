<?php

namespace App\Controllers;

use App\Models\Specie;
use App\Utils\Paginator;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class SpecieController extends BaseController
{
    public function index(RequestInterface $request, ResponseInterface $response)
    {
        $species = Specie::get();
        $perPage = 10;
        $total = count($species);
        $page = (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0);
        $pagination = Paginator::paginate($perPage, $total, $request->getParam('page'));
        $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
        $offset = ($perPage * $page);

        $order = (!is_null($request->getParam('order')) ? $request->getParam('order') : 'name_latin');
        $species = Specie::limit($perPage)
            ->offset($offset)
            ->orderBy($order)
            ->get();

        $this->render($response, 'specie/index', [
            'species' => $species,
            'order' => $order,
            'pagination' => $pagination
        ]);
    }
}