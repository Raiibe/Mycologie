<?php

namespace App\Controllers;

use App\Models\Biotope;
use App\Models\Edibility;
use App\Models\Specie;
use App\Models\TrophicStatus;
use App\Utils\Paginator;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class SearchController extends BaseController
{
    public function index(RequestInterface $request, ResponseInterface $response, $args)
    {
        $edibilities = Edibility::orderBy('status')->get();
        $biotopes = Biotope::orderBy('region')->get();
        $trophic_status = TrophicStatus::orderBy('status')->get();
        $other = Biotope::where('region', '=', 'Autre')->first();

            $this->render($response, 'search/index', [
            'edibilities' => $edibilities,
            'biotopes' => $biotopes,
            'trophic_status' => $trophic_status,
            'other' => $other
        ]);
    }

    public function search(RequestInterface $request, ResponseInterface $response)
    {
        $edibilities = Edibility::orderBy('status')->get();
        $biotopes = Biotope::orderBy('region')->get();
        $trophic_status = TrophicStatus::orderBy('status')->get();
        $other = Biotope::where('region', '=', 'Autre')->first();

        $search = $request->getParam('search');
        $specie = Specie::where('name_latin', 'like', $search . '%')->first();

        $this->render($response, 'search/confirm', [
            'edibilities' => $edibilities,
            'biotopes' => $biotopes,
            'trophic_status' => $trophic_status,
            'other' => $other,
            'specie' => $specie
        ]);
    }
}