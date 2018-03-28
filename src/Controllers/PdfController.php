<?php

namespace App\Controllers;

use App\Models\Specie;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Dompdf\Dompdf;

class PdfController extends BaseController
{

    public function index(RequestInterface $request, ResponseInterface $response)
    {

        $species_month_recent = Specie::whereBetween('created_at', [date('Y-m-1'), date('Y-m-t')])
            ->get();


        $this->render($response, 'app/pdf', [
            'species_month_recent' => $species_month_recent
        ]);
    }

}