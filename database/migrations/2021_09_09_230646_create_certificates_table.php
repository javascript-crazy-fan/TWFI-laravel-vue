<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCertificatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if( !Schema::hasTable( 'certificates' )){
            Schema::create('certificates', function (Blueprint $table) {
                $table->increments('id');
                $table->unsignedInteger('user_id')->nullable();
                $table->string('certificate_name')->nullable();
                $table->text('certificate_description')->nullable();
                $table->string('pdf_file', 100)->nullable();

                $table->timestamps();

                $table->softDeletes();

                $table->foreign('user_id', 'certificate_user_id')->references('id')->on('users')->onDelete('cascade');
            });
        }
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('certificates');
    }
}
