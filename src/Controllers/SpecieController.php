<?php

namespace App\Controllers;

use App\Models\Biotope;
use App\Models\Edibility;
use App\Models\Specie;
use App\Models\TrophicStatus;
use App\Utils\Paginator;
use App\Utils\Session;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Respect\Validation\Validator;
use voku\helper\AntiXSS;

class SpecieController extends BaseController
{
    public function index(RequestInterface $request, ResponseInterface $response)
    {
        $search = $request->getParam('search');

        if (!is_null($search)) {
            $xss_search = new AntiXSS();
            $xss_search->xss_clean($search);

            if (!$xss_search->isXssFound()) {
                $species = Specie::where('name_latin', 'like', $search . '%')
                    ->orWhere('name_french', 'like', $search . '%')
                    ->orderBy('name_latin')
                    ->get();


                $total = count($species);
                $page = (!is_null($request->getParam('page')) ? ($request->getParam('page') - 1) : 0);
                $pagination = Paginator::paginate(Paginator::$perPage, $total, $request->getParam('page'));
                $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
                $offset = (Paginator::$perPage * $page);

                $species = Specie::limit(Paginator::$perPage)
                    ->offset($offset)
                    ->where('name_latin', 'like', $search . '%')
                    ->orWhere('name_french', 'like', $search . '%')
                    ->orderBy('name_latin')
                    ->get();

                if (!empty($species)) {

                    $edibilities = Edibility::orderBy('status')->get();
                    $biotopes = Biotope::orderBy('region')->get();
                    $other = Biotope::where('region', '=', 'Autre')->first();
                    $trophic_status = TrophicStatus::orderBy('status')->get();

                    $this->render($response, 'specie/index', [
                        'species' => $species,
                        'edibilities' => $edibilities,
                        'biotopes' => $biotopes,
                        'trophic_status' => $trophic_status,
                        'other' => $other,
                        'pagination' => $pagination
                    ]);
                } else {
                    $this->flash('error', 'Aucun champignon correspondant !');
                    return $this->redirect($response, 'species');
                }
            } else {
                $this->flash('error', 'Impossible de traiter la recherche !');
                return $this->redirect($response, 'species');
            }
        } else {
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
            $pagination = Paginator::paginate(Paginator::$perPage, $total, $request->getParam('page'));
            $page = (($page > ($pagination['lastPage'] - 1)) ? ($pagination['lastPage'] - 1) : $page);
            $offset = (Paginator::$perPage * $page);

            $species = Specie::limit(Paginator::$perPage)
                ->offset($offset)
                ->where('edibility_id', 'like', (!is_null($edibility) ? $edibility->id : '%'))
                ->where('biotope_id', 'like', (!is_null($biotope) ? $biotope->id : '%'))
                ->where('trophic_status_id', 'like', (!is_null($trophic) ? $trophic->id : '%'))
                ->orderBy($order)
                ->get();

            $edibilities = Edibility::orderBy('status')->get();
            $biotopes = Biotope::orderBy('region')->get();
            $other = Biotope::where('region', '=', 'Autre')->first();
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
                'other' => $other,
                'pagination' => $pagination
            ]);
        }
    }

    public function view(RequestInterface $request, ResponseInterface $response, $args)
    {
        $specie = Specie::where('id', '=', $args['specie_id'])->first();
        $other = Biotope::where('region', '=', 'Autre')->first();

        if (!is_null($specie)) {
            $this->render($response, 'specie/view', [
                'specie' => $specie,
                'other' => $other
            ]);
        } else {
            $this->flash('error', 'Ce champignon n\'existe pas !');
            return $this->redirect($response, 'species');
        }
    }

    public function getSpecie(RequestInterface $request, ResponseInterface $response)
    {
        $species = Specie::where('name_latin', 'like', $request->getParam('name_latin') . '%')->get();

        return json_encode($species);
    }

    public function getSpecieFr(RequestInterface $request, ResponseInterface $response)
    {
        $species = Specie::where('name_french', 'like', $request->getParam('name_french') . '%')->get();

        return json_encode($species);
    }

    public function addForm(RequestInterface $request, ResponseInterface $response)
    {
        $edibilities = Edibility::orderBy('status')->get();
        $biotopes = Biotope::orderBy('region')->get();
        $trophic_status = TrophicStatus::orderBy('status')->get();
        $other = Biotope::where('region', '=', 'Autre')->first();

        $this->render($response, 'specie/add', [
            'edibilities' => $edibilities,
            'biotopes' => $biotopes,
            'trophic_status' => $trophic_status,
            'other' => $other
        ]);
    }

    public function create(RequestInterface $request, ResponseInterface $response)
    {
        if (false === $request->getAttribute('csrf_status')) {
            $this->flash('error', 'Une erreur est survenue pendant l\'envoi du formulaire !');
            return $this->redirect($response, 'species.addForm', []);
        } else {
            $xss_name_latin = new AntiXSS();
            $xss_name_latin->xss_clean($request->getParam('name_latin'));
            $xss_name_french = new AntiXSS();
            $xss_name_french->xss_clean($request->getParam('name_french'));

            $other_region = $request->getParam('other_region');
            $confusion = $request->getParam('confusion');

            if (strlen($other_region) > 0) {
                $xss_other_region = new AntiXSS();
                $xss_other_region->xss_clean($other_region);

                if ($xss_other_region->isXssFound()) {
                    $this->flash('error', 'Impossible de traiter le formulaire !');
                    return $this->redirect($response, 'species.addForm');
                }
            }

            if (strlen($confusion) > 0) {
                $xss_confusion = new AntiXSS();
                $xss_confusion->xss_clean($confusion);

                if ($xss_confusion->isXssFound()) {
                    $this->flash('error', 'Impossible de traiter le formulaire !');
                    return $this->redirect($response, 'species.addForm');
                }
            }

            if (!$xss_name_latin->isXssFound() && !$xss_name_french->isXssFound()) {
                $errors = [];

                if (!Validator::stringType()->notEmpty()->validate($request->getParam('name_latin'))) {
                    $errors['name_latin'] = "Veuillez saisir un nom latin valide.";
                }

                if (!Validator::stringType()->notEmpty()->validate($request->getParam('name_french'))) {
                    $errors['name_french'] = "Veuillez saisir un nom français valide.";
                }

                if (strlen($other_region) > 0) {
                    if (!Validator::stringType()->notEmpty()->validate($other_region)) {
                        $errors['other_region'] = "Veuillez saisir une région valide.";
                    }
                }

                if (strlen($confusion) > 0) {
                    if (!Validator::stringType()->notEmpty()->validate($confusion)) {
                        $errors['confusion'] = "Veuillez saisir un nom latin valide pour la confusion.";
                    }
                }

                if (empty($errors)) {
                    $specie_name_latin = Specie::where('name_latin', '=', $request->getParam('name_latin'))->first();
                    $edibility = Edibility::where('id', '=', $request->getParam('edibility'))->first();
                    $trophic_status = TrophicStatus::where('id', '=', $request->getParam('trophic_status'))->first();
                    $biotope = Biotope::where('id', '=', $request->getParam('biotope'))->first();

                    if (!is_null($specie_name_latin)) {
                        $this->flash('error', 'Ce nom latin existe déjà !');
                        return $this->redirect($response, 'species.addForm');
                    }

                    if (is_null($edibility)) {
                        $this->flash('error', 'Cette comestibilité est introuvable !');
                        return $this->redirect($response, 'species.addForm');
                    }

                    if (is_null($trophic_status)) {
                        $this->flash('error', 'Ce statut trophique est introuvable !');
                        return $this->redirect($response, 'species.addForm');
                    }

                    if (is_null($biotope)) {
                        $this->flash('error', 'Cette région est introuvable !');
                        return $this->redirect($response, 'species.addForm');
                    }

                    $specie_confusion = null;
                    if (strlen($confusion) > 0) {
                        $specie_confusion = Specie::where('name_latin', 'like', strval($confusion) . '%')
                            ->orWhere('name_french', 'like', strval($confusion) . '%')
                            ->first();

                        if (is_null($specie_confusion)) {
                            $this->flash('error', 'Ce champignon (confusion) est introuvable !');
                            return $this->redirect($response, 'species.addForm');
                        }
                    }

                    Specie::create([
                        'id' => uniqid(rand()),
                        'name_latin' => $request->getParam('name_latin'),
                        'name_french' => $request->getParam('name_french'),
                        'edibility_id' => $edibility->id,
                        'trophic_status_id' => $trophic_status->id,
                        'biotope_id' => $biotope->id,
                        'other_region' => (strlen($other_region) > 0 ? $other_region : null),
                        'confusion' => (strlen($confusion) > 0 ? $specie_confusion->name_latin : null),
                        'creator_id' => Session::get('user')->id
                    ]);

                    $this->flash('success', "Champignon ajouté avec succès.");
                    return $this->redirect($response, 'index');
                } else {
                    $this->flash('errors', $errors);
                    return $this->redirect($response, 'species.addForm', []);
                }
            } else {
                $this->flash('error', 'Impossible de traiter le formulaire !');
                return $this->redirect($response, 'species.addForm');
            }
        }
    }

    public function editForm(RequestInterface $request, ResponseInterface $response, $args)
    {
        $specie = Specie::where('id', '=', $args['specie_id'])->first();

        if (!is_null($specie)) {
            $edibilities = Edibility::orderBy('status')->get();
            $biotopes = Biotope::orderBy('region')->get();
            $trophic_status = TrophicStatus::orderBy('status')->get();
            $other = Biotope::where('region', '=', 'Autre')->first();

            $this->render($response, 'specie/edit', [
                'specie' => $specie,
                'edibilities' => $edibilities,
                'biotopes' => $biotopes,
                'trophic_status' => $trophic_status,
                'other' => $other
            ]);
        } else {
            $this->flash('error', 'Ce champignon n\'existe pas !');
            return $this->redirect($response, 'species');
        }
    }

    public function update(RequestInterface $request, ResponseInterface $response, $args)
    {
        $specie = Specie::where('id', '=', $args['specie_id'])->first();

        if (!is_null($specie)) {
            if (false === $request->getAttribute('csrf_status')) {
                $this->flash('error', 'Une erreur est survenue pendant l\'envoi du formulaire !');
                return $this->redirect($response, 'species.addForm', []);
            } else {
                $xss_name_latin = new AntiXSS();
                $xss_name_latin->xss_clean($request->getParam('name_latin'));
                $xss_name_french = new AntiXSS();
                $xss_name_french->xss_clean($request->getParam('name_french'));

                $other_region = $request->getParam('other_region');
                $confusion = $request->getParam('confusion');
                $comment = $request->getParam('comment');

                if (strlen($other_region) > 0) {
                    $xss_other_region = new AntiXSS();
                    $xss_other_region->xss_clean($other_region);

                    if ($xss_other_region->isXssFound()) {
                        $this->flash('error', 'Impossible de traiter le formulaire !');
                        return $this->redirect($response, 'species.editForm');
                    }
                }

                if (strlen($confusion) > 0) {
                    $xss_confusion = new AntiXSS();
                    $xss_confusion->xss_clean($confusion);

                    if ($xss_confusion->isXssFound()) {
                        $this->flash('error', 'Impossible de traiter le formulaire !');
                        return $this->redirect($response, 'species.editForm');
                    }
                }
                if (strlen($comment) > 0) {
                    $xss_comment = new AntiXSS();
                    $xss_comment->xss_clean($confusion);

                    if ($xss_comment->isXssFound()) {
                        $this->flash('error', 'Impossible de traiter le formulaire !');
                        return $this->redirect($response, 'species.editForm');
                    }
                }

                if (!$xss_name_latin->isXssFound() && !$xss_name_french->isXssFound()) {
                    $errors = [];

                    if (!Validator::stringType()->notEmpty()->validate($request->getParam('name_latin'))) {
                        $errors['name_latin'] = "Veuillez saisir un nom latin valide.";
                    }

                    if (!Validator::stringType()->notEmpty()->validate($request->getParam('name_french'))) {
                        $errors['name_french'] = "Veuillez saisir un nom français valide.";
                    }

                    if (strlen($other_region) > 0) {
                        if (!Validator::stringType()->notEmpty()->validate($other_region)) {
                            $errors['other_region'] = "Veuillez saisir une région valide.";
                        }
                    }

                    if (strlen($confusion) > 0) {
                        if (!Validator::stringType()->notEmpty()->validate($confusion)) {
                            $errors['confusion'] = "Veuillez saisir un nom latin valide pour la confusion.";
                        }
                    }

                    if (empty($errors)) {
                        $specie_name_latin = Specie::where('name_latin', '=', $request->getParam('name_latin'))->first();
                        $edibility = Edibility::where('id', '=', $request->getParam('edibility'))->first();
                        $trophic_status = TrophicStatus::where('id', '=', $request->getParam('trophic_status'))->first();
                        $biotope = Biotope::where('id', '=', $request->getParam('biotope'))->first();

                        if (!is_null($specie_name_latin) && $specie->name_latin != $request->getParam('name_latin')) {
                            $this->flash('error', 'Ce nom latin existe déjà !');
                            return $this->redirect($response, 'species.editForm');
                        }

                        if (is_null($edibility)) {
                            $this->flash('error', 'Cette comestibilité est introuvable !');
                            return $this->redirect($response, 'species.editForm');
                        }

                        if (is_null($trophic_status)) {
                            $this->flash('error', 'Ce statut trophique est introuvable !');
                            return $this->redirect($response, 'species.editForm');
                        }

                        if (is_null($biotope)) {
                            $this->flash('error', 'Cette région est introuvable !');
                            return $this->redirect($response, 'species.editForm');
                        }

                        if (strlen($confusion) > 0) {
                            $specie_confusion = Specie::where('name_latin', 'like', strval($confusion) . '%')->first();

                            if (is_null($specie_confusion)) {
                                $this->flash('error', 'Ce champignon (confusion) est introuvable !');
                                return $this->redirect($response, 'species.editForm');
                            }
                        }

                        if ($specie->name_latin != $request->getParam('name_latin') || $specie->name_french != $request->getParam('name_french')
                            || $specie->edibility_id != $edibility->id || $specie->trophic_status_id != $trophic_status->id
                            || $specie->biotope_id != $biotope->id || $specie->other_region != (strlen($other_region) > 0 ? $other_region : null)
                            || $specie->confusion != (strlen($confusion) > 0 ? $confusion : null)
                            || $specie->comment != (strlen($comment > 0 ? $comment : null))) {

                            $specie->name_latin = $request->getParam('name_latin');
                            $specie->name_french = $request->getParam('name_french');
                            $specie->edibility_id = $edibility->id;
                            $specie->trophic_status_id = $trophic_status->id;
                            $specie->biotope_id = $biotope->id;
                            $specie->other_region = (strlen($other_region) > 0 ? $other_region : null);
                            $specie->confusion = (strlen($confusion) > 0 ? $confusion : null);


                            $specie->comment = (strlen($comment) > 0 ? $comment : null);

                            $specie->save();

                            $this->flash('success', "Champignon modifié avec succès.");
                            return $this->redirect($response, 'index');
                        } else {
                            $this->flash('info', "Champignon non mis à jour, valeurs identiques.");
                            return $this->redirect($response, 'species');
                        }
                    } else {
                        $this->flash('errors', $errors);
                        return $this->redirect($response, 'species.editForm', []);
                    }
                } else {
                    $this->flash('error', 'Impossible de traiter le formulaire !');
                    return $this->redirect($response, 'species.editForm');
                }
            }
        } else {
            $this->flash('error', 'Ce champignon n\'existe pas !');
            return $this->redirect($response, 'species');
        }
    }

    public function deleteOne(RequestInterface $request, ResponseInterface $response, $args)
    {
        $specie = Specie::where('id', '=', $args['specie_id'])->first();

        if (!is_null($specie)) {
            $name_specie = $specie->name_latin;
            $specie->delete();

            $this->flash('success', 'Le champignon "' . $name_specie . '" a bien été supprimé !');
        } else {
            $this->flash('error', 'Ce champignon n\'existe pas !');
        }

        return $this->redirect($response, 'species');
    }

    public function tmpdb(RequestInterface $request, ResponseInterface $response, $args){
        $species = Specie::get();

        foreach($species as $specie){
            $specie->id = uniqid();
            $specie->save();
        }
    }
}