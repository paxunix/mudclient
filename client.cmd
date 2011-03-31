#nop $Id: client.cmd,v 1.1 1999/08/10 21:18:18 rsh Exp $

#toggle showtog off
#toggle showalias off
#toggle showvar off
#nop
#alias {#cr} {#eval {print $cursession "\r\n";}}
#alias {#(\d+) (.+)} {#eval {my $i;for($i=0;$i<$$1;$i++){DoCommand(KillBraces(q($$2)));}}}
#alias {#map (.+)} {#eval {$variables{'path'}.="$cmdsep".KillBraces(qq($$1));}}
#alias {#unmap} {#eval {my $t=$variables{'path'};$t=reverse($t);$t=~s/^.*?$cmdsep//;$t=reverse($t);$variables{'path'}=$t;}}
#alias {#mark} {#var path {}}
#alias {#path} {#eval {print "### Commands since ${cmdchar}mark:  ";print join('$cmdsep', q($$path))."\n";}}
#alias {#savepath (.+)} {#eval {my($new,$num,$last,$first,$s,@dirs)=('',1,'','',$variables{'path'},());push(@dirs,$1) while($variables{'directions'}=~/(\w+)((\s+)|$)/g);while($s=~s/^$cmdsep(.+?)($cmdsep|$)/$cmdsep/){if($last eq $1){$num++;}else{if($num==1){my $j='';$j=$cmdsep if($last ne ''&&(grep(/^$last$/,@dirs))[0]eq'');$new.="$j$last$j";}else{$new.="$num$last";}$last=$1;$num=1;}}$new.="$num$last"if($num>1);$aliases{KillBraces(q($$1))}=$new;print"### Path saved to alias \"".KillBraces(q($$1))."\"\n";}}
#alias {#if \((.+?)\) (.+)} {#eval {my $t='';$t=eval(q($$1));DoCommand(KillBraces(q($$2))) if($t)}}
#nop
#var directions {n s e w u d}
#toggle showvar on
#toggle showalias on
#toggle showtog on
