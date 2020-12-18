<?php

namespace Events;

use PHPMailer\PHPMailer\PHPMailer;

class EmailEvent implements Event
{
    private static $msg;
    private static $result;

    public static function sendEvent($email, $product = '', $price = 0.00)
    {
        $mail = new  PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 587;
        $mail->SMTPAuth = false;
        $mail->Username = 'aliftask95@gmail.com';
        $mail->Password = '@l1fTest';
        $mail->setFrom('aliftask95@gmail.com', 'Alif');
        $mail->addAddress($email, 'who am I?');
        if ($mail->addReplyTo($email, 'who am I?')) {
            $mail->Subject = 'Test';
            $mail->isHTML(false);
            $mail->Body = "You have bought $product for $price somoni";
            self::$result = $mail->send();
        }
        if (!self::$result) {
            self::$msg = false;
        } else {
            self::$msg = true;
        }

        return self::$msg;
    }
}