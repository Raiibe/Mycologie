<?php

use Illuminate\Database\Capsule\Manager;
use Illuminate\Database\Schema\Blueprint;

$dropTables = [
    'user',
    'edibility',
    'biotope',
    'trophic_status',
    'specie'
];

foreach ($dropTables as $table) {
    Manager::schema()->disableForeignKeyConstraints();
    Manager::schema()->dropIfExists($table);
}

Manager::schema()->create('user', function (Blueprint $table) {
    $table->engine = 'InnoDB';
    $table->increments('id');
    $table->string('mail')->unique();
    $table->string('password');
    $table->string('last_name')->nullable();
    $table->string('first_name')->nullable();
    $table->text('role');
    $table->timestamps();
    $table->index('id');
});

Manager::schema()->create('edibility', function (Blueprint $table) {
    $table->engine = 'InnoDB';
    $table->increments('id');
    $table->string('status')->unique();
    $table->timestamps();
    $table->index('id');
});

Manager::schema()->create('biotope', function (Blueprint $table) {
    $table->engine = 'InnoDB';
    $table->increments('id');
    $table->string('region')->unique();
    $table->timestamps();
    $table->index('id');
});

Manager::schema()->create('trophic_status', function (Blueprint $table) {
    $table->engine = 'InnoDB';
    $table->increments('id');
    $table->string('status')->unique();
    $table->timestamps();
    $table->index('id');
});

Manager::schema()->create('specie', function (Blueprint $table) {
    $table->engine = 'InnoDB';
    $table->increments('id');
    $table->string('name_latin')->unique();
    $table->string('name_french')->unique();
    $table->unsignedInteger('edibility_id');
    $table->unsignedInteger('biotope_id');
    $table->unsignedInteger('trophic_status_id');
    $table->timestamps();
    $table->index('id');
    $table->index('name_latin');
    $table->index('edibility_id');
    $table->index('biotope_id');
    $table->index('trophic_status_id');
});

Manager::schema()->table('specie', function(Blueprint $table) {
    $table->foreign('edibility_id')->references('id')->on('edibility')->onDelete('cascade')->onUpdate('cascade');
    $table->foreign('biotope_id')->references('id')->on('biotope')->onDelete('cascade')->onUpdate('cascade');
    $table->foreign('trophic_status_id')->references('id')->on('trophic_status')->onDelete('cascade')->onUpdate('cascade');
});