<?php
/*ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);*/

$postdata = file_get_contents("php://input");
$request = json_decode($postdata, true);

/*$request = [
    'birthday'   => '10/21/1991',
    'email'      => 'klebanandrew@gmail.com',
    'first_name' => 'Andrew',
    'id'         => '1592964664340668',
    'last_name'  => 'Kleban',
    'link'       => 'https://www.facebook.com/app_scoped_user_id/1592964664340668/',
    'locale'     => 'uk_UA',
    'name'       => 'Andrew Kleban',
];*/
/**
 *
 * birthday:"10/21/1991"
 * email:"klebanandrew@gmail.com"
 * first_name:"Andrew"
 * id:"1592964664340668"
 * last_name:"Kleban"
 * link:"https://www.facebook.com/app_scoped_user_id/1592964664340668/"
 * locale:"uk_UA"
 * name:"Andrew Kleban"
 *
 *
 */
session_start();
$conn = new PDO("mysql:host=localhost;dbname=cannes", 'root', 'kleban12');
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$conn->exec("set names utf8");
$stmt = $conn->prepare("INSERT INTO users (full_name, first_name, last_name, email, photo_url, social_id, profile_link, profile_type, metadata)
VALUES (:full_name, :first_name, :last_name, :email, :photo_url, :social_id, :profile_link, :profile_type, :metadata)");
$user_full_name = $request['first_name'] . ' ' . $request['last_name'];
$user_photo_url = 'https://graph.facebook.com/' . $request['id'] . '/picture?type=large';
$user_profile_type = 'FB';
$user_metadata = json_encode($request);

$stmt->bindParam(':full_name', $request['name']);
$stmt->bindParam(':first_name', $request['first_name']);
$stmt->bindParam(':last_name', $request['last_name']);
$stmt->bindParam(':email', $request['email']);
$stmt->bindParam(':photo_url', $user_photo_url);
$stmt->bindParam(':social_id', $request['id']);
$stmt->bindParam(':profile_link', $request['link']);
$stmt->bindParam(':profile_type', $user_profile_type);
$stmt->bindParam(':metadata', $user_metadata);

$insert_result = $stmt->execute();
$_SESSION['lastId'] = $conn->lastInsertId();
$id = $_SESSION['lastId'];
echo $id;

/*if(isset($_POST['video_link'])){
	$stmt = $conn->prepare("UPDATE `users`   
   SET `video_link` = :video_link
 WHERE `id` = :id");
	$stmt->bindParam(':video_link', $video_link);
	$stmt->bindParam(':id', $id);
	$insert_result = $stmt->execute();
	echo json_encode($insert_result);
	session_destroy();
} else {
	echo json_encode('no data');
}*/