<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('technicians', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('technician_id')->nullable();
            $table->unsignedBigInteger('review_id')->nullable();
            $table->string('company_name');
            $table->json('address_data')->nullable()->comment('contains full address');
            $table->string('email');
            $table->string('primary_contact_email')->nullable();
            $table->string('phone');
            $table->string('primary_contact')->nullable();
            $table->string('title')->nullable();
            $table->string('cell_phone')->nullable();
            $table->decimal('rate', 10, 3);
            $table->string('radius');
            $table->decimal('travel_fee', 10, 3);
            $table->string('status')->nullable();
            $table->string('preference')->nullable();
            $table->string('coi_file')->nullable();
            $table->string('msa_file')->nullable();
            $table->string('nda_file')->nullable();
            $table->date('coi_expire_date')->nullable();
            $table->date('msa_expire_date')->nullable();
            $table->string('nda')->nullable();
            $table->string('terms');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('technicians');
    }
};
