<?php

namespace App\Controllers;

use App\Models\Biotope;
use App\Models\Edibility;
use App\Models\Specie;
use App\Models\TrophicStatus;
use App\Utils\Paginator;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class SpecieController extends BaseController
{
    public function index(RequestInterface $request, ResponseInterface $response)
    {
        $perPage = 10;
        $species = Specie::get();
        $total = count($species);
        $page = (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0);
        $pagination = Paginator::paginate($perPage, $total, $request->getParam('page'));
        $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
        $offset = ($perPage * $page);

        $param = $request->getParam('order');
        $order = 'name_latin';

        if (!is_null($param)) {
            if ($param == 'name_latin' || $param == 'name_french') {
                $order = $param;
            } else {
                $str = explode('_', $param);

                if ($str[0] == 'edibility') {
                    $edibility = Edibility::where('id', '=', $str[1])->first();

                    $total = count($edibility->getSpecies()->get());
                    $pagination = Paginator::paginate($perPage, $total, $request->getParam('page'));
                    $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
                    $offset = ($perPage * $page);

                    $species = $edibility->getSpecies($offset, $order)
                        ->limit($perPage)
                        ->offset($offset)
                        ->orderBy($order)
                        ->get();

                    $order = $edibility->status;
                } elseif ($str[0] == 'biotope') {
                    $biotope = Biotope::where('id', '=', $str[1])->first();

                    $total = count($biotope->getSpecies()->get());
                    $pagination = Paginator::paginate($perPage, $total, $request->getParam('page'));
                    $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
                    $offset = ($perPage * $page);

                    $species = $biotope->getSpecies($offset, $order)
                        ->limit($perPage)
                        ->offset($offset)
                        ->orderBy($order)
                        ->get();

                    $order = $biotope->region;
                } else {
                    $trophic = TrophicStatus::where('id', '=', $str[1])->first();

                    $total = count($trophic->getSpecies()->get());
                    $pagination = Paginator::paginate($perPage, $total, $request->getParam('page'));
                    $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
                    $offset = ($perPage * $page);

                    $species = $trophic->getSpecies($offset, $order)
                        ->limit($perPage)
                        ->offset($offset)
                        ->orderBy($order)
                        ->get();

                    $order = $trophic->status;
                }
            }
        } else {
            $species = Specie::limit($perPage)
                ->offset($offset)
                ->orderBy($order)
                ->get();
        }

        $edibilities = Edibility::orderBy('status')->get();
        $biotopes = Biotope::orderBy('region')->get();
        $trophic_status = TrophicStatus::orderBy('status')->get();

        $this->render($response, 'specie/index', [
            'species' => $species,
            'edibilities' => $edibilities,
            'biotopes' => $biotopes,
            'trophic_status' => $trophic_status,
            'order' => $order,
            'pagination' => $pagination
        ]);
    }
}