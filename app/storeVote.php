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
$conn = new PDO("mysql:host=localhost;dbname=cannes", 'root', 'kleban12');
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$conn->exec("set names utf8");
$stmt = $conn->prepare("UPDATE `users`   
   SET `vote_film` = :vote_film, `vote_actress` = :vote_actress, `vote_actor` = :vote_actor, `vote_regiser` = :vote_regiser, `vote_style` = :vote_style 
 WHERE `id` = :id ");

$id = (int)$_SESSION['lastId'];


if(isset($request)){
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