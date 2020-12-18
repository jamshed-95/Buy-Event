<?php

namespace Events;

interface Event
{
    public static function sendEvent($contact, $product = '', $price = 0.00);
}