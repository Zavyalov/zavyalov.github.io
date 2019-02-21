#!/usr/bin/perl -l
use uni::perl;

print_header();

my $prev_hr = 10;
my @text;
while(<>) {
    chomp;
    if(/^$/) {
        print_text(\@text);
        @text = ();
    } else {
        push @text, $_;
    }
}

if(@text != 0) {
    print_text(\@text);
}

print_footer();

exit;

sub print_header {
    say qq|<html><head><meta charset="UTF-8"><meta name="robots" content="noindex"></head><body><!--noindex-->|;
}

sub print_text {
    my ($text) = @_;
    for my $i (1..$#$text) {
        my $str = $text->[$i];
        if($i == 1) {
            $str =~ s/>//g;
            $str =~ s/line.*//;
            $str =~ s/\.[0-9]+//g;
            if( $str =~ /^\d+:(\d\d)/ && $1 > $prev_hr ) {
                say "<hr/><center>$prev_hr minutos</center><hr/>";
                $prev_hr += 10;
            }

            say "<font size=-6 color=grey>$str</font><br/>";
            say "<font size=60px>";
            next;
        }

        $str =~ s|</c>|</font>|g;

        $str =~ s|<c\.vtt_yellow>|<font color="#594700">|g;
        $str =~ s|<c\.vtt_green>|<font color="#204700">|g;
        $str =~ s|<c\.vtt_magenta>|<font color="#470047">|g;
        $str =~ s|<c\.vtt_cyan>|<font color="#004747">|g;
        $str =~ s|<c\.vtt_blue>|<font color=#000047">|g;

        say "$str<br/>";
    }
    say "</font>";
}

sub print_footer {
    say qq|<!--/noindex--></body></html>|;
}
