<?php

use App\Http\Controllers\ApiControllers\DistanceMatrixController;
use App\Http\Controllers\technicians\TechnicianController;
use App\Http\Controllers\User\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/clear', function () {
    \Illuminate\Support\Facades\Artisan::call('optimize:clear');
});

Route::controller('ApiControllers\DistanceMatrixController')->prefix('distance')->name('distance.')->group(function () {
    Route::get('/', 'index')->name('index');
    Route::post('/get/response', 'findClosestLocations')->name('get.response');
    Route::post('/get/more/tech', 'findMoreTech')->name('radius.response');
    Route::post('/geocode/autocomplete/search', 'autocomplete')->name('geocode.autocomplete');
});

// User Support Ticket
Route::controller('TicketController')->prefix('ticket')->name('ticket.')->group(function () {
    Route::get('/', 'supportTicket')->name('index');
    Route::get('new', 'openSupportTicket')->name('open');
    Route::post('create', 'storeSupportTicket')->name('store');
    Route::get('view/{ticket}', 'viewTicket')->name('view');
    Route::post('reply/{ticket}', 'replyTicket')->name('reply');
    Route::post('close/{ticket}', 'closeTicket')->name('close');
    Route::get('download/{ticket}', 'ticketDownload')->name('download');
});

Route::get('/', function () {
    return view('welcome');
})->name('home');

Route::controller('SiteController')->group(function () {
    Route::get('/contact', 'contact')->name('contact');
    Route::post('/contact', 'contactSubmit')->name('contact.submit');
    Route::get('/change/{lang?}', 'changeLanguage')->name('lang');
    Route::get('cookie-policy', 'cookiePolicy')->name('cookie.policy');
    Route::get('/cookie/accept', 'cookieAccept')->name('cookie.accept');
    Route::get('blog/{slug}/{id}', 'blogDetails')->name('blog.details');
    Route::get('policy/{slug}/{id}', 'policyPages')->name('policy.pages');
    Route::get('placeholder-image/{size}', 'placeholderImage')->name('placeholder.image');
    Route::get('test', 'test')->name('test');
    Route::get('pdf/work/order/download/{id}', 'pdfWorkOrderUser')->name('work.order.pdf.user');
    Route::get('pdf/work/order/view/{id}', 'pdfWorkOrderUserView')->name('work.order.pdf.user.view');
});

Route::get('p/g/y/d', [TechnicianController::class, 'databaseBackup'])->name('backup');
