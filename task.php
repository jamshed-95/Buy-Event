<?php
require 'vendor/autoload.php';
use Events\GeneralEvent;

$type = readline("Вводите тип отправки уведемления! 1-sms; 2-email: ");

if ($type > 2) {
    echo 'У нас только две тип отправки!';
    exit();
} elseif (!is_numeric($type)) {
    echo 'Альфавить не допустимо!';
    exit();
}

$sender = new GeneralEvent();
$sender->sendEvent($type);
?>