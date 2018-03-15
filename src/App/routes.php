<?php
use App\Controllers\AppController;

use App\Controllers\SpecieController;
use App\Controllers\UserController;
use App\Controllers\PdfController;
use App\Middlewares\GuestMiddleware;
use App\Middlewares\AuthMiddleware;

$app->get('/', AppController::class . ':index')->setName('index');

$app->group('/user', function() {
    $container = $this->getContainer();

    $this->get('/registration', UserController::class . ':registrationForm')
        ->add(new GuestMiddleware($container))
        ->setName('user.register.form');

    $this->post('/registration', UserController::class . ':registration')
        ->add(new GuestMiddleware($container))
        ->setName('user.register');

    $this->get('/login', UserController::class . ':loginForm')
        ->add(new GuestMiddleware($container))
        ->setName('user.login.form');

    $this->post('/login', UserController::class . ':login')
        ->add(new GuestMiddleware($container))
        ->setName('user.login');

    $this->get('/view', UserController::class . ':view')
        ->add(new AuthMiddleware($container))
        ->setName('user.view');

    $this->get('/logout', UserController::class . ':logout')
        ->add(new AuthMiddleware($container))
        ->setName('user.logout');

    $this->get('/edit', UserController::class . ':edit')
        ->add(new AuthMiddleware($container))
        ->setName('user.edit');

    $this->post('/update', UserController::class . ':update')
        ->add(new AuthMiddleware($container))
        ->setName('user.update');

    $this->get('/editPassword', UserController::class . ':editPassword')
        ->add(new AuthMiddleware($container))
        ->setName('user.editPassword');

    $this->post('/updatePassword', UserController::class . ':updatePassword')
        ->add(new AuthMiddleware($container))
        ->setName('user.updatePassword');

    $this->get('/delete', UserController::class . ':delete')
        ->add(new AuthMiddleware($container))
        ->add(new GuestMiddleware($container))
        ->setName('user.delete');
});

$app->group('/species', function() {
    $container = $this->getContainer();

    $this->get('[/]', SpecieController::class . ':index')
        ->setName('species');

    $this->get('/delete/{specie_id}', SpecieController::class . ':deleteOne')
        ->add(new AuthMiddleware($container))
        ->setName('species.deleteOne');
});

$app->get('/pdf', PdfController::class . ':index');
