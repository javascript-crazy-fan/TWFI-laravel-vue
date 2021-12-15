<?php

Route::group(['prefix' => '/v1', 'middleware' => ['auth'], 'namespace' => 'Api\V1', 'as' => 'api.'], function () {
    Route::post('change-password', 'ChangePasswordController@changePassword')->name('auth.change_password');
    Route::apiResource('roles', 'RolesController');
    Route::apiResource('users', 'UsersController');
    Route::apiResource('titles', 'TitleController');
    Route::apiResource('permission-lists', 'PermissionListController');
    Route::apiResource('companies', 'CompaniesController');

    
    Route::get('projects/assigned-user-list', 'ProjectController@getAssignedUserList');
    Route::get('projects/all-assign', 'ProjectController@getAssignAll');
    Route::get('projects/safety/{projectId}', 'ProjectController@safety');
    Route::post('projects/storeSafety', 'ProjectController@storeSafety');
    Route::get('projects/safety_delete/{safetyId}', 'ProjectController@safety_delete');
    Route::get('projects/getSafety/{safetyId}', 'ProjectController@getSafety');
    Route::post('projects/editSafety/{safetyId}', 'ProjectController@editSafety');
    Route::get('projects/pdfData/{safetyId}', 'ProjectController@pdfData');
    Route::get('projects/getUsers', 'ProjectController@getUsers');
    Route::get('projects/daily/{projectId}', 'ProjectController@safety');
    Route::apiResource('projects', 'ProjectController');

    Route::apiResource('project-assign', 'ProjectAssignController');

    Route::post('file-upload', 'UploadController@upload');
    Route::get('get-auth', 'UsersController@getAuth');

    Route::get('timecards/get-user-data/{projectId}/{userId}/{startDate}/{endDate}', 'TimecardController@getUserData');
    Route::get('timecards/get-all/{projectId}/{startDate}/{endDate}', 'TimecardController@getAll');
    Route::get('timecards/get-week-data/{projectId}/{userId}/{startDate}/{endDate}', 'TimecardController@getWeekData');
    Route::post('timecards/add-entry', 'TimeCardController@addEntry');
    Route::get('timecards/delete-entry/{id}', 'TimecardController@deleteEntry');
    Route::post('timecards/add-checkin', 'TimecardController@addCheckin');
    Route::post('timecards/get-checkins-data', 'TimecardController@getCheckinsData');
    Route::get('timecards/delete-checkin/{id}', 'TimecardController@deleteCheckin');
    
    Route::apiResource('timecards', 'TimecardController');
});
