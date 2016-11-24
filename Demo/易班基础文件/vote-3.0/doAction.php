<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/11/1
 * Time: 22:03
 */
header('content-type:text/html;charset=utf-8');
require_once 'connect.php';
require_once 'ip.php';
const N =10;
const M =20;

$vote_studentID =htmlspecialchars($_GET['vote_studentID']);
$vote_id =htmlspecialchars($_GET['vote_id']);
$vote_ip =htmlspecialchars($_GET['vote_ip']);

if(empty($vote_studentID)){
    echo "<script>alert('您还没有登录，请先登录');location.href='login.html';</script>";
    exit;
}

$sql ="SELECT email FROM vote_student WHERE studentID='$vote_studentID'";
$rs = $mysqli ->query($sql);
$s = $rs->fetch_assoc();
$t =$s['email'];
$email =base64_encode($t);


$flag =checkip($vote_ip);
if($flag){
    $sql ="select id from vote_vote WHERE vote_ip ='$vote_ip'";
    $rs =$mysqli->query($sql);
    $num =$rs->num_rows;

    $sql_m ="select id from vote_vote WHERE vote_studentID='$vote_studentID'";
    $rs_m =$mysqli->query($sql_m);
    $num_m = $rs_m->num_rows;

    if($num<=M) {
        if($num_m<=N){
            if($vote_id==1){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=1";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第一类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==2){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=2";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==3){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=3";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==4){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=4";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==5){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=5";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==6){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=6";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==7){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=7";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==8){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=8";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==9){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=9";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==10){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=10";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==11){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=11";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==12){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=12";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==13){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=13";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==14){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=14";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==15){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=15";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==16){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=16";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==17){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=17";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==18){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=18";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==19){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=19";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

            if($vote_id==20){
                $sql_0 ="select id from vote_vote WHERE vote_studentID='$vote_studentID' AND vote_id=20";
                $rs_0 =$mysqli->query($sql_0);
                $num_0 = $rs_0->num_rows;//用于区分第2类分组
                if($num_0<1){
                    $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
                    $mysqli->query($sql_1);

                    $sql_5 ="insert into vote_vote(vote_id,vote_studentID,vote_ip) VALUES ('$vote_id','$vote_studentID','$vote_ip')";
                    $mysqli->query($sql_5);
                }else{
                    echo "<script>alert('你已经ta了，请不要重复投！');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
                    exit;
                }
            }

        }else{
            $html = <<<EOT
            <html>
               <head>
                  <meta http-equiv="refresh" content="1;url=vote_rs.php">
               </head>
               <body>
               <h1>你已经投过10票了，一人最多投10票！</h1>
               正在跳转到结果页.......
               </body>
            </html>
EOT;
            echo $html;
            exit;
        }
    }else{
        $html = <<<EOT
            <html>
               <head>
                  <meta http-equiv="refresh" content="3;url=vote_rs.php">
               </head>
               <body>
               <h1>后台系统检测到你有恶意刷票行为，已经开始跟踪分析，请勿恶意刷票，否则后果自负！</h1>
               正在跳转到结果页.......
               </body>
            </html>
EOT;
        echo $html;
        exit;
    }
}else{
    $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="2;url=login.html">
           </head>
           <body>
           <h1>登录信息有误，请重新登录</h1>
           正在跳转到首页.......
           </body>
        </html>
EOT;
    echo $html;
    exit;
}

$mysqli->close();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="refresh" content="1;url=vote.php?EIOP90HA8Ge34WQ56INE7D=<?php echo $email ?>">
</head>
<body>
<h1>投票成功！</h1>
正在跳转.......
</body>
</html>
