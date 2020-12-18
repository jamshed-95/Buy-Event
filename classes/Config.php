<?php

namespace Events;


class Config
{

    protected static $host = '127.0.0.1';
    protected static $database = 'buyevent';
    protected static $username = 'root';
    protected static $password = '1';

    public static function conectToDb()
    {
        try {
        $dbh = new \PDO("mysql:host=".self::$host.";dbname=".self::$database, self::$username, self::$password);
        return $dbh;
        } catch (\PDOException $e) {
            echo "Не удалось соединится на Базу Данных: " . $e->getMessage();
            exit();
        }


    }
}