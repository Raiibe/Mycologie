<?php
namespace App\Middlewares\Twig;
use Dompdf\Options;
use Slim\Http\Request;
use Slim\Http\Response;
use Dompdf\Dompdf;
/**
 * class PickerMiddleware.php
 *
 * Get vars in configuration files
 * Create picker() function for Twig
 *
 * @package    Middlewares
 * @author     WILMOUTH Steven
 * @version    1
 */
class PdfMiddleware
{
    private $twig;
    /**
     * PickerMiddleware constructor.
     * @param \Twig_Environment $twig
     */
    public function __construct(\Twig_Environment $twig)
    {
        $this->twig = $twig;
    }
    /**
     * Invoke du middleware
     * @param Request $request
     * @param Response $response
     * @param $next
     * @return Response
     */
    public function __invoke(Request $request, Response $response, $next)
    {

        $this->twig->addFunction(new \Twig_SimpleFunction('stream', function($template, $uri, $species) use ($request) {
            $html = $this->twig->render($template, [ 'uri' => $uri , 'species' => $species]);
            $options = new Options();
            $options->set( 'isRemoteEnabled', TRUE );
            $dompdf = new Dompdf($options);

            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'landscape');
            $dompdf->render();
            $dompdf->stream();
        }, ['is_safe' => ['html']]));
        return $next($request, $response);
    }
}