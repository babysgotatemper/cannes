<?php
/*ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);*/
$postdata = file_get_contents("php://input");
$request = json_decode($postdata, true);
//var_dump($request); exit;

/**
 * { ["id"]=> int(307178105)
 * ["first_name"]=> string(12) "Андрій"
 * ["last_name"]=> string(12) "Клебан"
 * ["sex"]=> int(2)
 * ["screen_name"]=> string(11) "id307178105"
 * ["bdate"]=> string(10) "21.10.1991"
 * ["city"]=> array(2) { ["id"]=> int(2106) ["title"]=> string(31) "Івано-Франківськ" }
 * ["country"]=> array(2) { ["id"]=> int(2) ["title"]=> string(14) "Україна" }
 * ["photo_max_orig"]=> string(63) "https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg"
 * ["has_mobile"]=> int(1) }
 *
 */
session_start();
//$conn = new PDO("mysql:host=localhost;dbname=cannes", 'root', 'kleban12');//Prod DB
$conn = new PDO("mysql:host=192.168.212.116;dbname=cannes", 'cannes', 'dBCw-ue82-nss');//local DB
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$conn->exec("set names utf8");
$stmt = $conn->prepare("INSERT INTO users (full_name, first_name, last_name, email, photo_url, social_id, profile_link, profile_type, metadata)
VALUES (:full_name, :first_name, :last_name, :email, :photo_url, :social_id, :profile_link, :profile_type, :metadata)");
$user_full_name = $request['first_name'].' '. $request['last_name'];
$vk_email = 'VK does not provide this info';
$vk_profile_link = 'https://vk.com/'.$request['id'];
$vk_profile_type = 'VK';
$vk_metadata = json_encode($request);
$stmt->bindParam(':full_name', $user_full_name);
$stmt->bindParam(':first_name', $request['first_name']);
$stmt->bindParam(':last_name', $request['last_name']);
$stmt->bindParam(':email', $vk_email);
$stmt->bindParam(':photo_url', $request['photo_max_orig']);
$stmt->bindParam(':social_id', $request['id']);
$stmt->bindParam(':profile_link', $vk_profile_link);
$stmt->bindParam(':profile_type', $vk_profile_type);
$stmt->bindParam(':metadata', $vk_metadata);

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