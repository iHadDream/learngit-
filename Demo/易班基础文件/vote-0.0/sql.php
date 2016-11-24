<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/10/26
 * Time: 23:20
 */
header('content-type=text/html;charset=utf-8');

$mysqli =new mysqli('localhost','root','','vote');

if($mysqli->connect_errno){
    echo '数据库连接错误';
    exit;
}

$mysqli->set_charset('utf8');

//$sql =<<<EOT
//    CREATE TABLE IF NOT EXISTS vote_user(
//        vote_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
//        vote_name VARCHAR(20) NOT NULL,
//        vote_votes SMALLINT DEFAULT 0
//    );
//EOT;

$sql =<<<EOT
    CREATE TABLE IF NOT EXISTS vote_vote(
        id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
        vote_id TINYINT NOT NULL,
        voter_ip VARCHAR(15) DEFAULT ''
    );
EOT;

//$sql ="INSERT INTO vote_user(vote_name) VALUES ('刘天恒'),('田宇康'),('周嘉鸿'),('李源'),('肖男'),('陈垚宇'),('马宇驰'),('何英俊'),('樊1'),('樊2'),('樊3'),('樊4'),('樊5'),('樊6'),('樊8')";

$rs =$mysqli->query($sql);
var_dump($rs);

$mysqli->close();