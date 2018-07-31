#!/usr/bin/env perl
use strict;
use FindBin qw($Bin);

use File::Spec;
use File::Basename;
use Data::Dumper;
use YAML::XS;

=head1 SYNOPSIS

export FALCON_PLUS=SOME_DIR/falcon-plus
$0

=cut

my @files = find_files();

my %gen;

for my $file(@files)
{
    my($module, $create, $doc) = parse_file($file);
    push @{ $gen{$module} }, [$create, $doc] if $module;
}

gen_modules(%gen);
    
sub gen_modules
{
    my %gen = @_;
    my $dst = File::Spec->join($Bin,"../lib/falcon_plus_api/api");
    die "Dst directory($dst) not exists" unless -d $dst;

    for my $module(keys %gen)
    {
        my $file = File::Spec->join($dst, lc($module).".ex");
        my $cont = "defmodule FalconPlusApi.Api.$module do\n";

        $cont .= "  alias Maxwell.Conn\n";
        $cont .= "  alias FalconPlusApi.{Util, Sig, Api}\n";

        for(@{$gen{$module}})
        { 
            my($create, $doc) = @$_;
            $cont .= $doc. $create. "\n";
        }
        $cont .= "end\n";
        open my $fh, ">", $file or warn "$file can't write. Skip!" and next;
        print $fh $cont;
        close $fh;
        print "Gen $module Suc -> $file\n";

    }
}



sub find_files
{
    my $base_dir = $ENV{FALCON_PLUS} or die "not defined envirenment \$FALCON_PLUS";
    
    die "doc directory is not exists" unless -d ( my $post_dir = File::Spec->join($base_dir, "docs", "_posts"));
    
    my(@dirs, @files) = glob "$post_dir/*";
    
    for my $dir(@dirs)
    {
        push @files, $dir =~ /\.md$/ ? $dir : glob "$dir/*.md";
    }
    
    grep{ -f $_ }@files;
}

sub parse_file
{
    my $file = shift;

    warn "$file read fail" and return unless my $cont = do { local $/ = undef; open my $fh, '<', $file; <$fh> };

    my(undef, $attr, $doc, %attr) = split  "---", $cont;
    $doc =~ s/^\n*//g;
    %attr = parse_attr($attr);

    warn "$file not contain apiurl. skip!" and return unless $attr{apiurl} and $attr{type};

    my $need_sig = $doc =~ /Session.*authentication.*Required/;
    my ($module, $func) = parse_filename($file);

    my $func_define = 
        " " x 2
        . "def $func("
        . ($attr{url_param} ? "$attr{url_param}, " : "")
        . ($need_sig ? "sig, ": "")
        . "addr, "
        . "opts \\\\ []) do\n";

    my $func_content =  ""
        . ($need_sig ? " " x 4 . "sig = Sig.get_sig(sig)\n" : "")
        . " " x 4 . $attr{apiurl}. "\n"
        . " " x 4 . "|> Util.url(addr)". "\n"
        . " " x 4 . "|> Conn.new()". "\n"
        . " " x 4 . "|> Api.set_opts(opts)". "\n"
        . ($need_sig ? " " x 4 . "|> Conn.put_req_header(\"Apitoken\", sig)\n" : "")
        . " " x 4 . "|> Api.$attr{type}". "\n"
        . " " x 4 . "|> Api.get_result\n";

    my $func_end = " " x 2 . "end\n";

    my $create = $func_define . $func_content . $func_end;

    $doc =~ s/^/    /mg;
    $doc = '  @doc """'. "\n". $doc.  '  """'. "\n";
    #print "$file###$module###$func###$need_sig\n";
    #print $doc;
    #print $create;
    #<>;
    ($module, $create, $doc)
}
sub parse_filename
{
    my $file = shift;
    my $name = basename $file;
    $name =~ s/.*-//;
    $name =~ s/\.md//;
    my @sp = split "_", $name;
    scalar @sp == 1 ? ("Default", $sp[0]) : ( ucfirst(shift @sp), join("_", @sp) )

}
sub parse_attr
{
    my($attr, %attr) = shift;

    while( $attr =~ /^(.+?):\s*(.+)$/mg )
    {
        my($key, $value) = ($1, $2);
        $value =~ s/^'//;
        $value =~ s/'$//;

        $attr{$key} = $value;
    }
    $attr{apiurl} =~ s/\:(\w+)/\#{$1}/g if $attr{apiurl};
    $attr{apiurl} =~ /\#\{(\w+)\}/ unless $1;
    $attr{url_param} = $1 if $1;
    $attr{apiurl} = "~s<$attr{apiurl}>" if $attr{apiurl};
    $attr{type} =  lc($attr{type}) if $attr{type};
    %attr;
}
