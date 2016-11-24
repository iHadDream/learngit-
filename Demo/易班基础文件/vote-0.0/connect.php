<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/10/26
 * Time: 23:44
 */
header('content-type:text/html;charset=utf-8');
$mysqli = new mysqli('localhost','root','','vote');

if($mysqli->connect_errno){
    echo '数据库连接错误';
    exit;
}else{
    $mysqli->set_charset('utf8');
}