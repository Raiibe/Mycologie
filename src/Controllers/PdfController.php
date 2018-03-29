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

        $species = Specie::get();
        $uri = $request->getUri()->getScheme() . '://' . $request->getUri()->getHost() . $request->getUri()->getBasePath() . ':' . $request->getUri()->getPort();
        $this->render($response, 'app/pdf', [
            'uri' => $uri,
            'species' => $species
        ]);



//        $this->render($response, 'pdf/index', [
//            'uri' => $uri
//        ]);
    }
}