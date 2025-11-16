<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
  <img src="https://img.shields.io/badge/backend-laravel-red" alt="Backend Laravel">
  <img src="https://img.shields.io/badge/frontend-vue.js-brightgreen" alt="Frontend Vue.js">
  <img src="https://img.shields.io/badge/auth-laravel%20sanctum-blue" alt="Laravel Sanctum">
</p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About This Project

<p align="justify">Simple inventory management system built with Laravel (API) and Vue.js (SPA frontend).</p>

<p align="justify">This application provides inventory management features that include maintaining item data, recording incoming and outgoing stock, and automatically updating item quantities based on each transaction. Users can select an item, set the date, quantity, and description for both incoming and outgoing transactions, ensuring that stock movements are recorded clearly and accurately. In addition, a reporting feature is available to display all items along with their final stock, with the ability to filter reports by transaction date to make it easier to monitor inventory over a specific period.</p>

## Installation Guide

Before you begin, make sure you have Laravel installed on your machine.

1. Clone the repository:
    ```bash
    git clone https://github.com/PangestuSES/testtech_elitech.git
    ```
2. Navigate to the project directory
    ```bash
    cd testech-elitech
    ```
5. Install vue and depedencies
    ```bash
    composer install
    npm install
    ```
4. Setup the `.env` file by duplicating `.env.example`
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```
5. Update the .env file with your database credentials and other necessary configurations.

    ```bash
    DB_DATABASE=elitech_test
    DB_USERNAME=username_db
    DB_PASSWORD=password_db
    ```
6. Set up the database (choose one)

    **Option 1: Using migrations & seeders**

    ```bash
    php artisan migrate --seed

    ```

    **Option 2: Using sql dump**\
    The SQL dump file is located in the `database` folder (`database/elitech_test.sql`). You can import it with:
    ```bash
    mysql -u your_username -p elitech_test < database/elitech_test.sql
    ```

7. Start the Laravel server & Vue
    ```bash
    npm run dev
    ```
    ```bash
    php artisan serve
    ```
8. Open your browser and visit `http://localhost:8000` to access the application.
</br>
</br>

## Account
```bash
Email: admin@gmail.com
Password: password
```
