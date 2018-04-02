<?php

namespace App\Controllers;

use App\Models\Specie;
use App\Models\User;
use App\Utils\Paginator;
use App\Utils\Session;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class AppController extends BaseController
{

    public function index(RequestInterface $request, ResponseInterface $response)
    {
        $species_recent = Specie::limit(5)
            ->orderBy('created_at', 'DESC')
            ->get();

        $species_month_recent = Specie::whereBetween('created_at', [date('Y-m-1'), date('Y-m-t')])
            ->get();

        $total = count($species_month_recent);
        $page = (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0);
        $pagination = Paginator::paginate(Paginator::$perPage, $total, $request->getParam('page'));
        $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
        $offset = (Paginator::$perPage * $page);

        $species_month_recent = Specie::limit(Paginator::$perPage)
            ->offset($offset)
            ->whereBetween('created_at', [date('Y-m-1'), date('Y-m-t')])
            ->orderBy('name_latin')
            ->get();

        $this->render($response, 'app/index', [
            'species_recent' => $species_recent,
            'species_month_recent' => $species_month_recent,
            'pagination' => $pagination
        ]);
    }

}