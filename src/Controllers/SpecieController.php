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

        $param = $request->getParam('order');
        $order = 'name_latin';

        if (!is_null($param)) {
            if ($param == 'name_latin' || $param == 'name_french') {
                $order = $param;
            }
        }

        $e = $request->getParam('e');
        $b = $request->getParam('b');
        $ts = $request->getParam('ts');

        $edibility = Edibility::where('status', '=', $e)->first();
        $biotope = Biotope::where('region', '=', $b)->first();
        $trophic = TrophicStatus::where('status', '=', $ts)->first();

        $species = Specie::where('edibility_id', 'like', (!is_null($edibility) ? $edibility->id : '%'))
            ->where('biotope_id', 'like', (!is_null($biotope) ? $biotope->id : '%'))
            ->where('trophic_status_id', 'like', (!is_null($trophic) ? $trophic->id : '%'))
            ->get();

        $total = count($species);
        $page = (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0);
        $pagination = Paginator::paginate($perPage, $total, $request->getParam('page'));
        $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
        $offset = ($perPage * $page);

        $species = Specie::limit($perPage)
            ->offset($offset)
            ->where('edibility_id', 'like', (!is_null($edibility) ? $edibility->id : '%'))
            ->where('biotope_id', 'like', (!is_null($biotope) ? $biotope->id : '%'))
            ->where('trophic_status_id', 'like', (!is_null($trophic) ? $trophic->id : '%'))
            ->orderBy($order)
            ->get();

        $edibilities = Edibility::orderBy('status')->get();
        $biotopes = Biotope::orderBy('region')->get();
        $trophic_status = TrophicStatus::orderBy('status')->get();

        $this->render($response, 'specie/index', [
            'species' => $species,
            'edibilities' => $edibilities,
            'biotopes' => $biotopes,
            'trophic_status' => $trophic_status,
            'order' => $order,
            'e' => $e,
            'b' => $b,
            'ts' => $ts,
            'pagination' => $pagination
        ]);
    }

    public function getSpecie(RequestInterface $request, ResponseInterface $response, $args)
    {

        $specie = Specie::where('id', '=', $args['id'])->first();

        $this->render($response, 'specie/specie', [
            'specie' => $specie
        ]);
    }
}