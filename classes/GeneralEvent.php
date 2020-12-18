<?php

namespace Events;

use Events\Config;
use Events\EmailEvent;
use Events\SmsEvent;

class GeneralEvent
{
    protected $myResults = array();
    protected $status=0;
    public function sendEvent($type)
    {
        $con = Config::conectToDb();
        $query='SELECT c.id, c.telephone,c.email,p.product,p.price,p.id pId FROM  clients c INNER JOIN purchase p ON c.id=p.client_id WHERE p.event_status=:status';
        $stmt = $con->prepare($query);
        $stmt->bindParam(":status", $this->status);
        if ($stmt->execute()) {
            foreach ($stmt->fetchAll() as $row) {
                switch ($type) {
                    case 1:
                        $this->myResults = SmsEvent::sendEvent($row['telephone'], $row['tovar'], $row['price']);
                        break;
                    case 2:
                        $this->myResults = EmailEvent::sendEvent($row['email'], $row['tovar'], $row['price']);
                        break;
                }
                if ($this->myResults) {
                    $this->status=1;
                    echo "Операция успешно выполнено для клиента! ".$row['email']."\n";
                } else {
                    $this->status=2;
                    echo "Операция не выполнено для клиента! ".$row['email']."\n";
                }
                $upt=$con->prepare('UPDATE purchase p SET p.event_status = :status WHERE p.id= :pId');
                $upt->bindParam(":status", $this->status);
                $upt->bindParam(":pId",    $row['pId']);
                $upt->execute();
                $ins=$con->prepare("INSERT INTO event_history (client_id, purchase_id, sms_id) VALUES (:id,:pId ,:myResults)");
                $ins->bindParam(":id", $row['id']);
                $ins->bindParam(":pId",    $row['pId']);
                $ins->bindParam(":myResults",    $this->myResults);
                $ins->execute();
            }
        } else {
            echo 'Список пуст!';
        }


    }
}