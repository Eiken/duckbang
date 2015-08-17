use Irssi;
use Irssi::Irc;
use strict;
use vars qw($VERSION %IRSSI);
use Encode;

$VERSION = "0.0.3";

%IRSSI = (
    authors     =>  "Eiken",
    contact     =>  "",
    name        =>  "duckbang",
    description =>  "",
    license     =>  "",
    url         =>  "",
);

sub sig_public {
  my ($server, $msg, $nick, $address, $target) = @_;
  my $botnick = "gonzobot";
  my $swedenchan = "#Sweden";


  if ($botnick eq $nick) {
    if ($target eq $swedenchan) {
      Irssi::print "duckbang: gonzobot said $msg";
      my $msg2 = encode('ascii', $msg);
      my $littlestring = '\?\?\?\?\?';
      my @matches = $msg2 =~ /($littlestring)/g;
      my $count = @matches;

      if ($count > 0) {
        Irssi::print "bang";
        #my $sleepTime = 10+int(rand(10));
        my $sleepTime = 0;
        Irssi::print $sleepTime;
        sleep($sleepTime);
        $server->command("MSG $target .bang");
      }
    }
  }

}

Irssi::signal_add_last('message public', 'sig_public');


