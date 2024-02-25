<?php

use Illuminate\Support\Facades\Route;

Route::namespace('User\Auth')->name('user.')->group(function () {

    Route::controller('LoginController')->group(function () {
        Route::get('/login', 'showLoginForm')->name('login');
        Route::post('/login', 'login');
        Route::get('logout', 'logout')->name('logout');
    });

    Route::controller('RegisterController')->group(function () {
        Route::get('register/{reference?}', 'showRegistrationForm')->name('register');
        Route::get('hello', 'hello')->name('hello');
        Route::post('register', 'register')->middleware('registration.status');
        Route::post('check-mail', 'checkUser')->name('checkUser');
    });

    Route::controller('ForgotPasswordController')->prefix('password')->name('password.')->group(function () {
        Route::get('reset', 'showLinkRequestForm')->name('request');
        Route::post('email', 'sendResetCodeEmail')->name('email');
        Route::get('code-verify', 'codeVerify')->name('code.verify');
        Route::post('verify-code', 'verifyCode')->name('verify.code');
    });
    Route::controller('ResetPasswordController')->group(function () {
        Route::post('password/reset', 'reset')->name('password.update');
        Route::get('password/reset/{token}', 'showResetForm')->name('password.reset');
    });
});

Route::middleware('auth')->name('user.')->group(function () {
    //authorization
    Route::namespace('User')->controller('AuthorizationController')->group(function () {
        Route::get('authorization', 'authorizeForm')->name('authorization');
        Route::get('resend-verify/{type}', 'sendVerifyCode')->name('send.verify.code');
        Route::post('verify-email', 'emailVerification')->name('verify.email');
        Route::post('verify-mobile', 'mobileVerification')->name('verify.mobile');
        Route::post('verify-g2fa', 'g2faVerification')->name('go2fa.verify');
    });
    Route::middleware(['check.status'])->group(function () {
        Route::get('user-data', 'User\UserController@userData')->name('data');
        Route::post('user-data-submit', 'User\UserController@userDataSubmit')->name('data.submit');

        Route::middleware('registration.complete')->namespace('User')->group(function () {
            Route::controller('UserController')->group(function () {
                Route::get('dashboard', 'home')->name('home');
                //work order manage
                Route::Post('work/order/service', 'service')->name('work.order.service');
                Route::Post('work/order/project', 'project')->name('work.order.project');
                Route::Post('work/order/install', 'install')->name('work.order.install');
                Route::Post('work/order/update', 'updateWorkOrder')->name('work.order.update');
                Route::get('work/order/onsite', 'Onsite')->name('work.order.onsite');
                Route::get('work/order/view/pdf/user/dashboard', 'userViewPdf')->name('work.order.view.pdf');
                Route::post('onsite/order/ticket/update', 'ticketUpdate')->name('onsite.ticketUpdate');
                Route::get('work/order/details/{orderId}', 'detailsOrder')->name('work.order.details');
                Route::get('customer/autocomplete', 'autoComplete')->name('customer.autocomplete');
                Route::get('get/customer/details', 'getCustomer')->name('customerData');
                Route::post('store/customer/site', 'storeSite')->name('store.site');
                Route::get('get/site/data', 'getSite')->name('get.site');
                Route::get('site/autocomplete', 'siteAutoComplete')->name('site.autocomplete');
                Route::get('site/autocomplete2', 'customerAutoComplete')->name('customer.autocomplete.wosearch');
                Route::post('site/bulk/import', 'siteImport')->name('site.import');
                Route::get('download/sample/site/import/excel', 'sampleSiteExcel')->name('sample.site.import.excel');
                Route::get('get/work/order/search', 'getWorkOrderSearch')->name('get.work.order.search');
                Route::get('get/work/order/details', 'getWorkOrderData')->name('get.work.order');
                Route::get('order/data', 'fieldPopulator')->name('order.data');
                Route::get('work/order/general/notes/{id}', 'generalNotes')->name('workOrder.generalNotes');
                Route::get('work/order/dispatch/notes/{id}', 'dispatchNotes')->name('workOrder.dispatchNotes');
                Route::get('work/order/billing/notes/{id}', 'billingNotes')->name('workOrder.billingNotes');
                Route::get('work/order/tech/support/notes/{id}', 'techSupportNotes')->name('workOrder.techSupportNotes');
                Route::get('work/order/closeout/notes/{id}', 'closeoutNotes')->name('workOrder.closeoutNotes');
                Route::get('/get/site/history/{id}', 'orderIdsiteHistory')->name('order.site.history');
                Route::post('sub/ticket/create', 'subTicket')->name('sub.ticket');
                Route::post('create/check/in', 'checkIn')->name('checkin');
                Route::post('create/check/out/{id}', 'initiateCheckOut')->name('checkout');
                Route::post('create/round/trip/check/out/{id}', 'roundTripCheckOut')->name('checkout.roundtrip');
                Route::post('check/in/out/update/{id}', 'checkOutEdit')->name('checkout.edit');
                Route::get('check/in/out/delete/{id}', 'checkOutDelete')->name('checkout.delete');
                Route::get('pdf/user/work/order/download/{id}', 'pdfWorkOrderUser')->name('work.order.pdf.user');

                Route::get('work/order/sub/ticket/{id}', 'workOrderSubTicket')->name('table.sub.ticket');
                Route::get('check/in/out/{id}', 'checkInOutTable')->name('table.checkInOut');
                Route::get('customer/parts/details', 'customerParts')->name('customer.parts.details');
                Route::get('inventory/autocomplete', 'inventoryAutoComplete')->name('inventory.autocomplete');
                Route::get('inventory/item/details', 'inventoryItem')->name('inventory.item');
                Route::get('inventory/item/calculation', 'inventoryCalculation')->name('inventory.calculation');
                Route::get('ftech/skillsets', 'skills')->name('ftech.skills');
                Route::post('new/ftech/registration', 'newTech')->name('ftech.new');
                Route::post('ftech/skillsets/new', 'newSkill')->name('skillsets.new');
                Route::get('free/geocode', 'geocode')->name('free.geocode');
                Route::get('ftech/autocomplete/data', 'ftechAuto')->name('technician.autocomplete');
                Route::get('ftech/details', 'techData')->name('ftech.data');
                Route::post('ftech/import', 'techImport')->name('ftech.import');
                Route::get('ftech/excel/download', 'techExcel')->name('download.excel');
                Route::post('customer/import', 'customerImport')->name('customer.import');
                Route::get('customer/excel/download', 'customerExcel')->name('customer.download.excel');
                Route::post('customer/registration', 'storeCustomer')->name('customer.reg');
                Route::get('customer/autocomplete', 'customerSearch')->name('customer.autocomplete');
                Route::get('get/customer/details', 'fetchCustomer')->name('fetch.customer');
                Route::post('tech/get/distance', 'getResponse')->name('tech.distance');
                Route::post('get/work/order', 'findWorkOrder')->name('workOrder.get');
                Route::post('check/work/order', 'ifNullWorkOrder')->name('workOrder.check');
                Route::post('find/tech/for/work/worder', 'distanceResponse')->name('findTech.withDistance');
                Route::post('dispatch/work/order', 'assignTech')->name('dispatch.order');
                Route::post('send/mail', 'sendMail')->name('sendmail.tech');
                // Route::get('/assigned/tech')
                //end work order manage
                //2FA
                Route::get('twofactor', 'show2faForm')->name('twofactor');
                Route::post('twofactor/enable', 'create2fa')->name('twofactor.enable');
                Route::post('twofactor/disable', 'disable2fa')->name('twofactor.disable');

                //KYC
                Route::get('kyc-form', 'kycForm')->name('kyc.form');
                Route::get('kyc-data', 'kycData')->name('kyc.data');
                Route::post('kyc-submit', 'kycSubmit')->name('kyc.submit');

                //Report
                Route::any('deposit/history', 'depositHistory')->name('deposit.history');
                Route::get('transactions', 'transactions')->name('transactions');

                Route::get('attachment-download/{fil_hash}', 'attachmentDownload')->name('attachment.download');
            });
            //Profile setting
            Route::controller('ProfileController')->group(function () {
                Route::get('profile-setting', 'profile')->name('profile.setting');
                Route::post('profile-setting', 'submitProfile');
                Route::get('change-password', 'changePassword')->name('change.password');
                Route::post('change-password', 'submitPassword');
            });
            // Withdraw
            Route::controller('WithdrawController')->prefix('withdraw')->name('withdraw')->group(function () {
                Route::middleware('kyc')->group(function () {
                    Route::get('/', 'withdrawMoney');
                    Route::post('/', 'withdrawStore')->name('.money');
                    Route::get('preview', 'withdrawPreview')->name('.preview');
                    Route::post('preview', 'withdrawSubmit')->name('.submit');
                });
                Route::get('history', 'withdrawLog')->name('.history');
            });
        });
        // Payment
        Route::middleware('registration.complete')->prefix('deposit')->name('deposit.')->controller('Gateway\PaymentController')->group(function () {
            Route::any('/', 'deposit')->name('index');
            Route::post('insert', 'depositInsert')->name('insert');
            Route::get('confirm', 'depositConfirm')->name('confirm');
            Route::get('manual', 'manualDepositConfirm')->name('manual.confirm');
            Route::post('manual', 'manualDepositUpdate')->name('manual.update');
        });
    });
});
