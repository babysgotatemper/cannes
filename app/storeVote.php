<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$postdata = file_get_contents("php://input");
$request = json_decode($postdata, true);
//var_dump($request); exit;

/**
 * {
 *  vote_film,
 *  vote_actress
 *  vote_actor
 *  vote_regiser
 *  vote_style
 * }
 */
session_start();
//$conn = new PDO("mysql:host=localhost;dbname=cannes", 'root', 'kleban12');//Prod DB
$conn = new PDO("mysql:host=192.168.212.116;dbname=cannes", 'cannes', 'dBCw-ue82-nss');//local DB
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$conn->exec("set names utf8");
$stmt = $conn->prepare("UPDATE `users`   
   SET `vote_film` = :vote_film, `vote_actress` = :vote_actress, `vote_actor` = :vote_actor, `vote_regiser` = :vote_regiser, `vote_style` = :vote_style 
 WHERE `id` = :id ");

if(isset($_SESSION['lastId'])){
    $id = (int)$_SESSION['lastId'];
} else {
    echo 'unauthorized';exit;
}


if(isset($request)){
    //validations
    if(!isset($request['film'])){ $request['film'] = 0;}
    if(!isset($request['actress'])){ $request['actress'] = 0;}
    if(!isset($request['actor'])){ $request['vote_actor'] = 0;}
    if(!isset($request['regiser'])){ $request['regiser'] = 0;}
    if(!isset($request['style'])){ $request['style'] = 0;}

    $stmt->bindParam(':vote_film', $request['film']);
    $stmt->bindParam(':vote_actress', $request['actress']);
    $stmt->bindParam(':vote_actor', $request['actor']);
    $stmt->bindParam(':vote_regiser', $request['regiser']);
    $stmt->bindParam(':vote_style', $request['style']);
    $stmt->bindParam(':id', $id);

    $insert_result = $stmt->execute();
    echo json_encode($insert_result);
    session_destroy();
} else {
    echo json_encode('no data');
}
