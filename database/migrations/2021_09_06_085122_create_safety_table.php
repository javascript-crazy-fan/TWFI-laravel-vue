<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSafetyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('safeties', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('project_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->string('created_by', 100)->nullable();
            $table->string('pic', 100)->nullable();
            $table->string('phone', 100)->nullable();
            $table->string('sse', 100)->nullable();
            $table->integer('mentor')->nullable();
            $table->text('jobs')->nullable();
            $table->string('requirements', 100)->nullable();
            $table->string('area', 100)->nullable();
            $table->string('attachments', 100)->nullable();
            $table->text('signatures')->nullable();
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
        Schema::dropIfExists('safety');
    }
}
