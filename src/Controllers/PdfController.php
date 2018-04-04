<?php

namespace App\Controllers;

use App\Models\Specie;
use App\Utils\Paginator;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class PdfController extends BaseController
{
    public function add(RequestInterface $request, ResponseInterface $response, $args)
    {
        if (!isset($_SESSION['pdfGenerator'])) {
            $json = ['species' => []];
            $_SESSION['pdfGenerator'] = json_encode($json);
        }

        $specie = Specie::where('id', '=', $args['specie_id'])->first();

        if (!is_null($specie)) {
            if (isset($_SESSION['pdfGenerator'])) {
                $json = json_decode($_SESSION['pdfGenerator']);
                array_push($json->species, $specie->id);
                $_SESSION['pdfGenerator'] = json_encode($json);
                $this->flash('success', 'Le champignon "' . $specie->name_latin . '" a bien été ajouté au pdf !');
            } else {
                $this->flash('error', 'Une erreur est survenue lors de l\'ajout du champignon au pdf, veuillez réessayer !');
            }
        } else {
            $this->flash('error', 'Ce champignon n\'existe pas !');
        }

        return $this->redirect($response, 'species');
    }

    public function listPreview(RequestInterface $request, ResponseInterface $response)
    {
        if (isset($_SESSION['pdfGenerator'])) {
            $json = json_decode($_SESSION['pdfGenerator']);
            $speciesBDD = Specie::orderBy('name_latin')->get();
            $species = [];

            foreach ($json->species as $specie_id) {
                $specie = Specie::where('id', '=', $specie_id)->first();

                if (!is_null($specie)) {
                    $index = null;

                    for ($i = 0; $i < sizeof($speciesBDD); $i++) {
                        if ($speciesBDD[$i]->id == $specie->id) {
                            $index = $i + 1;
                            break;
                        }
                    }

                    $tabSpecie = [ 'specie' => $specie, 'index' => $index ];

                    array_push($species, $tabSpecie);
                }
            }

            if (sizeof($species) > 0) {
                $uri = $request->getUri()->getScheme() . '://' . $request->getUri()->getHost() . $request->getUri()->getBasePath() . ':' . $request->getUri()->getPort();

                $this->render($response, 'app/pdf', [
                    'species' => $species,
                    'uri' => $uri,
                    'stream' => false
                ]);
            } else {
                $this->flash('info', 'Il n\'y a aucun champignon à imprimer !');
                return $this->redirect($response, 'index');
            }
        } else {
            $this->flash('info', 'Il n\'y a aucun champignon à imprimer !');
            return $this->redirect($response, 'index');
        }
    }

    public function listDownload(RequestInterface $request, ResponseInterface $response)
    {
        if (isset($_SESSION['pdfGenerator'])) {
            $json = json_decode($_SESSION['pdfGenerator']);
            $speciesBDD = Specie::orderBy('name_latin')->get();
            $species = [];

            foreach ($json->species as $specie_id) {
                $specie = Specie::where('id', '=', $specie_id)->first();

                if (!is_null($specie)) {
                    $index = null;

                    for ($i = 0; $i < sizeof($speciesBDD); $i++) {
                        if ($speciesBDD[$i]->id == $specie->id) {
                            $index = $i + 1;
                            break;
                        }
                    }

                    $tabSpecie = [ 'specie' => $specie, 'index' => $index ];

                    array_push($species, $tabSpecie);
                } else {
                    $this->flash('error', 'Ce champignon n\'existe pas !');
                }
            }

            if (sizeof($species) > 0) {
                $uri = $request->getUri()->getScheme() . '://' . $request->getUri()->getHost() . $request->getUri()->getBasePath() . ':' . $request->getUri()->getPort();

                $this->render($response, 'app/pdf', [
                    'species' => $species,
                    'uri' => $uri,
                    'stream' => true
                ]);
            } else {
                $this->flash('info', 'Il n\'y a aucun champignon à imprimer !');
                return $this->redirect($response, 'index');
            }
        } else {
            $this->flash('info', 'Il n\'y a aucun champignon à imprimer !');
            return $this->redirect($response, 'index');
        }
    }

    public function delete(RequestInterface $request, ResponseInterface $response)
    {
        if (isset($_SESSION['pdfGenerator'])) {
            unset($_SESSION['pdfGenerator']);

            $this->flash('success', 'Votre liste a bien été vidé !');
        } else {
            $this->flash('error', 'Votre liste est déjà vide !');
        }

        return $this->redirect($response, 'index');
    }
}