<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/10/26
 * Time: 10:30
 */
header('content-type:text/html;charset=utf-8');
require_once 'ip.php';
require_once 'connect.php';

$ip = GetIP();

//$sql_1= "INSERT INTO vote_vote(voter_ip) VALUES ('$ip')";
//$rs_1 = $mysqli->query($sql_1);


$sql =<<<EOT
select vote_id,vote_name,vote_votes from vote_user
EOT;
$rs = $mysqli->query($sql);
$filed = $rs->fetch_all(MYSQLI_ASSOC);
$mysqli->close();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>toupiao</title>

    <link href="css/style1.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/script1.js"></script>
    <style type="text/css">
    </style>
    <style>
        #popupcontent{position: absolute;visibility: hidden;overflow:auto;border:1px solid #CCC;background-color:#F9F9F9;border:1px solid #333;padding:5px; z-index:1000; width:500px; height:0px;
            left:50%;/*FF IE7*/
            top: 50%;/*FF IE7*/

            margin-left:-250px!important;/*FF IE7 该值为本身宽的一半 */
            margin-top:-250px!important;/*FF IE7 该值为本身高的一半*/

            margin-top:0px;

            position:fixed!important;/*FF IE7*/
            position:absolute;/*IE6*/

            _top:expression(eval(document.compatMode &&document.compatMode=='CSS1Compat')?
documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);/*IE5 IE5.5*/


        }
        body,td,th {
            font-size: 10pt;
        }
        .nav{width:985px;margin:0 auto; text-align:center;font:normal 16px/34px "微软雅黑";color:#fff;height:34px;background: #FF4040; /* for non-css3 browsers */

        }
        .nav a{font:bold 14px/34px "宋体";color:#fff;margin:0 35px;}
        #cleft{
            float:left;
            width:750px;
            background:#FFF;
            padding:10px;}
        #cleft ul{ width:750px; float:left; margin:10px 0;}
        h3{color:#fff;font-weight:bold;height:22px;line-height:22px;padding:0 10px;
            background: #FF4040; /* for non-css3 browsers */
        .img_a{clear:both;}
        .img_a li{ height:190px;width:105px;text-align:center; float:left;color:#333;font-weight:bold;margin:15px 8px 0 8px;line-height:17px; display:inline; overflow:hidden;font-size:12px;}
        .img_a li img{border:1px solid #ccc;margin-bottom:3px;padding:2px;}
        .img_a li input{ vertical-align:middle;}
        .img_a li span{ display:block;}
        .img_a li span img{border:none;margin-top:3px;}
        h3{font-size:14px;}
        h1,h2,h3,h4,h5,h6{font:normal 12px/180% "宋体"; text-align:left;font-weight:bolder;}
        .r_a{
            font-size: 16px;
            font-weight: bold;
            color: #FF4040;
        }
        .r_a a{color:#b70000;}
        .r_a img{margin:5px 0;}
        .user_info{width:600px; float:left; clear:both; padding-left:80px;}
        .user_info i{ font-style:normal; }
    </style>
</head>
<body style="background-color:#DEF0FC">
<div style="background-color:#FFF;margin:0 auto;height:35px; line-height:35px;">
    <div style="width:1000px;margin:0 auto; background-color:#FFF; list-style-type:none;height:35px; line-height:35px;">
        <span style="list-style:none; padding-bottom:20px;"><a href="#" target="_blank">第16届理想与成才报告团</a>|<a href="#" target="_blank">第15届理想与成才报告团</a>|<a href="#" target="_blank">第14届理想与成才报告团</a>|<a href="#" target="_blank">第13届理想与成才报告团</a>|<a href="#" target="_blank">第12届理想与成才报告团</a>|<a href="#" target="_blank">第11届理想与成才报告团</a></span>
    </div></div>
<div style="margin:0 auto; text-align:center; width:980px;">
    <img src="images/16.jpg">
</div><div style="clear:both"></div>
<div class="nav" ><a href="zuixin.html">第16届评选首页</a>|<a href="jieshao.html">活动介绍</a>|<a href="huigu.html">往期回顾</a>|<a href="index.html">理想与成才报告团专题网站首页</a></div>
<div style="width:180px;border:1px solid #c6c3c3;padding:5px;margin-right:185px; float:right; background:#fff;display:inline; overflow:hidden;line-height:200%;">
    <h3>投票规则：</h3>
    <b style="display:block;line-height:26px;">1.投票时间 </b>　　11月1日10时—12月1日21时，为期30天。 <b style="display:block;line-height:26px;">2.投票范围 </b>　　主办单位公布的候选人，候选人按姓氏笔画排序。 <b style="display:block;line-height:26px;">3.投票方式 </b> <b style="display:block;line-height:26px;"><font color="#FF0000">务请注意：网络投票与微信投票每人每次最多选择4名入围候选人 。</font><br \>（一）网络投票： </b>　　点击入围候选人照片下方的投票框，严禁利用任何不正当的手段刷票或者投票，一经查实违规行为将扣除存疑票数。 <br \>
    <b style="display:block;line-height:26px;">（二）微信页面： </b>　　通过“东师易班”微信公众平台进行投票；<br \>
    <strong>具体如下</strong>：<br \>
    　　1)请在微信中关注“东师易班”微信公众号（可扫二维码添加）<br \> 　　2)关注“东师易班”后，请以留言方式投票，格式如下：<br \>
    　　本人真实姓名+投票+候选人编号（可多选）+本人学号。
    <br \>　　例如：如果投票人真实姓名为“刘某”，手机号码为“123456789”，想为第01、03、07、13号候选人投票，则留言内容为：“刘某+投票+01、03、07、13+123456789”
    <br \>　　3)微信投票请属真实姓名和学号，否则投票无效。
    <br \>
    <h3>指导单位：</h3>
    <div class="r_a"> <a href="#">东北师范大学</a> <a href="#">学生处</a></div>
    <h3>主办单位：</h3>
</div>
<div class="itagBox">
    <ul class="artist_l">
        <li class="tag1">
            <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/张明新.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html">
                    <?php echo $filed['0']['vote_name']?>
                </a>
            </div>
            <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['0']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['0']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1 ">
            <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/牟平.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html">
                    <?php echo $filed['1']['vote_name']?>
                </a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['1']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['1']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/李新月.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $filed['2']['vote_name']?></a>
            </div>
            <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['2']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['2']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/徐菲.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $filed['3']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['3']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['3']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/刘佳玉.png">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html"> <?php echo $filed['4']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['4']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['4']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/李一聪.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $filed['5']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['5']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['5']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/赵娜娜.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"><?php echo $filed['6']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['6']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['6']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/徐浩.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $filed['7']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['7']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['7']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/李娜.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $filed['8']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['8']['vote_votes']?></b>票</div>
                <div class="cvote"><a style="color:#FFF;" href="doAction.php?voter_ip=<?php echo $ip?>&vote_id=<?php echo $filed['8']['vote_id']?>">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/孙亚荣.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> 孙亚荣</a>
            </div> <div class="votedo">
                <div class="cvotenum"><b>0</b>票</div>
                <div class="cvote"><a style="color:#FFF;">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/章芯卉.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> 章芯卉</a>
            </div> <div class="votedo">
                <div class="cvotenum"><b>0</b>票</div>
                <div class="cvote"><a style="color:#FFF;">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/王煌.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> 王  煌</a>
            </div> <div class="votedo">
                <div class="cvotenum"><b>0</b>票</div>
                <div class="cvote"><a style="color:#FFF;">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/贾丙渊.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> 贾丙渊</a>
            </div> <div class="votedo">
                <div class="cvotenum"><b>0</b>票</div>
                <div class="cvote"><a style="color:#FFF;">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/傅琛洁.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> 傅琛洁</a>
            </div> <div class="votedo">
                <div class="cvotenum"><b>0</b>票</div>
                <div class="cvote"><a style="color:#FFF;">投票</a></div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/刘玉婷.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> 刘玉婷</a>
            </div> <div class="votedo">
                <div class="cvotenum"><b>0</b>票</div>
                <div class="cvote"><a style="color:#FFF;">投票</a></div>
            </div>
        </li>
    </ul>
</div>
</body>
</html>


