<?php

namespace Events;

use Twilio\Rest\Client;

class SmsEvent implements Event
{
    private static $msg=true;

    public static function sendEvent($number, $product = '', $price = 0.00)
    {
        if (strlen($number) < 9 or strlen($number) > 12) {
            self::$msg = false;
        } elseif ($number == 9) {
            $number = '+992' . $number;
        }
        if (self::$msg) {
            $sid = "ACa2fb5c234f14203a9cee72c13e72b559";
            $token = "0a500bb9328af708a5f797a32e0f9ab7";
            $twilio = new Client($sid, $token);
            self::$msg = $twilio->messages
                ->create($number,
                    [
                        "body" => "You have bought $product for $price somoni",
                        "from" => "+12058832365"
                    ]
                );
        }
        return self::$msg;
    }

}