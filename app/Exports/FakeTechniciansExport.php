<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Faker\Factory as Faker;
use Illuminate\Support\Collection;

class FakeTechniciansExport implements FromCollection
{
    /**
     * @return \Illuminate\Support\Collection
     */

    public function collection()
    {
        $faker = Faker::create();

        $technicians = [];


        for ($i = 0; $i < 5000; $i++) {
            $skills = [];

            for ($j = 0; $j < 5; $j++) {
                $words = $faker->randomElement(['Cable Certifier', 'Fiber', 'Fiber Tester', 'Wi-Fi', 'Heat Mapping', 'Air Magnet']);
                $skills[] = $words;
            }

            $skillsetsString = implode(', ', $skills);

            $technicians[] = [
                'company_name' => $faker->company,
                'address' => $faker->streetAddress,
                'country' => $faker->country,
                'city' => $faker->city,
                'state' => $faker->state,
                'zip_code' => $faker->randomElement(['10001', '90001', '58324', '60001']),
                'email' => $faker->email,
                'primary_contact_email' => $faker->email,
                'phone' => $faker->randomElement(['01254788925', '01236547896', '01254796454']),
                'primary_contact' => $faker->name,
                'title' => $faker->randomElement(['title1', 'title2', 'title3', 'title4']),
                'cell_phone' => $faker->randomElement(['01254788925', '01236547896', '01254796454']),
                'rate' => $faker->randomElement(['50', '80', '90', '100']),
                'radius' => $faker->randomElement(['50', '80', '90']),
                'travel_fee' => $faker->randomElement(['50', '80', '90']),
                'status' => $faker->randomElement(['Active', 'Inactive', 'Pending']),
                'preference' => $faker->randomElement(['Yes', 'No']),
                'coi_expire_date' => $faker->randomElement(['21-10-23', '22-10-23', '23-10-23', '24-10-23']),
                'msa_expire_date' => $faker->randomElement(['21-10-23', '22-10-23', '23-10-23', '24-10-23']),
                'nda' => $faker->randomElement(['Yes', 'No']),
                'terms' => $faker->randomElement(['30', '40', '60', '90']),
                'skillsets' => $skillsetsString,
            ];
        }

        return new Collection($technicians);
    }
}
