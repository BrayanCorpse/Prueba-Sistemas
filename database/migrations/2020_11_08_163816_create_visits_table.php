<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVisitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('visits', function (Blueprint $table) {
            $table->increments('idv');
            $table->integer('idh')->unsigned();
            $table->bigInteger('idu')->unsigned();
            $table->string('fecha');
            $table->integer('visits');
            $table->foreign('idh')->references('idh')->on('hotels');
            $table->foreign('idu')->references('id')->on('users');
            $table->timestamp('deleted_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('visits');
    }
}
