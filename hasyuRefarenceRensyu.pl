#!/usr/bin/env perl
use strict;
use warnings;

#----- ハッシュを作る（ハッシュリファレンス）
my $fav = {
				name => 'takeshi',  
				favorite_foods => ['apple',  'grape']
};

my $fav2 = {
				name => 'tatu',  
				favorite_foods => ['uni',  'niku']
};

my $fav3 = {
				name => 'nanaha',  
				favorite_foods => ['choko',  'grape']
};

#----- ハッシュを配列にセットする
my @favo;
push @favo, $fav;
push @favo, $fav2; 
push @favo, $fav3;

#----- 配列にセットしたハッシュのキーのfavorite_foodsがまた配列のリファレンスなのでデファレントしてランクのハッシュを作成する
my %cnt;
for my $f (@favo) {
				for my $ff (@{$f->{favorite_foods}}) {
								if(exists($cnt{${ff}})) {       # <= ハッシュのキーが存在すれば値をインクリメント、なかったら1をセットする
												++$cnt{"$ff"};
								} else {
										$cnt{"$ff"} = 1;
								};
				}
}

#while ((my $key,  my $value) = each(%cnt) {
#				print "$key => $value\n";
#}
#

#----- ハッシュの値がランクなので、値を降順にソートして表示する
for my $key (sort{ $cnt{$b} cmp $cnt{$a}} keys %cnt ) {
				print "$key => $cnt{$key}\n";
}

