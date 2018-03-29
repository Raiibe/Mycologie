<?php

namespace App\Controllers;

use App\Models\Specie;
use App\Utils\Paginator;
use App\Utils\Session;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class PdfController extends BaseController
{
    public function create(RequestInterface $request, ResponseInterface $response)
    {
        $species = Specie::get();

        $total = count($species);
        $page = (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0);
        $pagination = Paginator::paginate(Paginator::$perPage, $total, $request->getParam('page'));
        $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
        $offset = (Paginator::$perPage * $page);

        $species = Specie::limit(Paginator::$perPage)
            ->offset($offset)
            ->orderBy('name_latin')
            ->get();

        if (!isset($_COOKIE['pdfGenerator'])) {
            $json = ['species' => []];
            setcookie('pdfGenerator', json_encode($json), time() + 60 * 60 * 2);
        }

        $this->render($response, 'pdf/create', [
            'species' => $species,
            'pagination' => $pagination
        ]);
    }

    public function add(RequestInterface $request, ResponseInterface $response, $args)
    {
        $specie = Specie::where('id', '=', $args['specie_id'])->first();

        if (!is_null($specie)) {
            if (isset($_COOKIE['pdfGenerator'])) {
                $json = json_decode($_COOKIE['pdfGenerator']);
                var_dump('test');
                array_push($json->species, $specie->id);
                setcookie('pdfGenerator', json_encode($json), time() + 60 * 60 * 2);
                $this->flash('success', 'Le champignon "' . $specie->name_latin . '" a bien été ajouté au pdf !');
            } else {
                $this->flash('error', 'Une erreur est survenue lors de l\'ajout du champignon au pdf, veuillez réessayer !');
            }
        } else {
            $this->flash('error', 'Ce champignon n\'existe pas !');
        }

        return $this->redirect($response, 'pdf.create');
    }

    public function listPreview(RequestInterface $request, ResponseInterface $response)
    {
        // under
    }

    public function listDownload(RequestInterface $request, ResponseInterface $response)
    {
        // under
    }
}