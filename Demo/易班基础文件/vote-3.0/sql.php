<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/11/6
 * Time: 23:26
 */
header('content-type:text/html;charset=utf-8');
require_once 'connect.php';

////创建vote_user表
//$sql =<<<EOT
//CREATE TABLE IF NOT EXISTS vote_user(
//    vote_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
//    vote_name VARCHAR(30) NOT NULL,
//    vote_votes SMALLINT DEFAULT 0
//);
//EOT;

////创建vote_user表
//$sql =<<<EOT
//CREATE TABLE IF NOT EXISTS vote_vote(
//    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
//    vote_id TINYINT UNSIGNED NOT NULL,
//    vote_studentID CHAR(10) NOT NULL,
//    vote_ip VARCHAR(15) NOT NULL
//);
//EOT;
$sql ="INSERT INTO vote_user(vote_name) VALUES ('樊1'),('樊2'),('樊3'),('樊4'),('樊5'),('樊6'),('樊7'),('樊8'),('樊9'),('樊10'),('樊11'),('樊12'),('樊13'),('樊14'),('樊15'),('樊16'),('樊17'),('樊18'),('樊19'),('樊20')";


$mysqli->query($sql);


