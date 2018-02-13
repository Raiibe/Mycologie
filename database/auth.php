<?php

use Illuminate\Database\Capsule\Manager;
use Illuminate\Database\Schema\Blueprint;

$dropTables = [
    'user'
];

foreach ($dropTables as $table) {
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
});
