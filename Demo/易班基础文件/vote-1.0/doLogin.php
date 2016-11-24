<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/10/31
 * Time: 13:37
 */
header('content-type:text/html;charset=utf-8');
require_once '../connect.php';

$getEmail = htmlspecialchars($_GET['email']);
preg_match_all('/\w+(?=@nenu.edu.cn)/',$getEmail,$arr);
$email = $arr['0']['0'];

$studentID = htmlspecialchars($_GET['studentID']);


$sql = "SELECT id FROM vote_student WHERE studentID='$studentID' AND email='$email'";
$rs = $mysqli->query($sql);

if($rs->num_rows){
    echo '用户合法';
}else{
    echo '用户不合法';
}

