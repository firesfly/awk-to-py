BEGIN {
FS=OFS="\t"
}
FNR==NR{
	lemma[$1]=$1"\t"$2"\t"$3;
	next;
}

{ 
    words[$2] = words[$2] FS $1;
}

END {
	print lemma[$2]
	
    for ( ix in words)
	{
		sub("^"FS, "", words[ix]);
        words_x = split(words[ix], extrac,"\t");
		long = extract_stem(extrac, words_x);
		
		string="";
		for (i in extrac)
		{
			if (substr(extrac[i], long+1)  != "")
			{
				print substr(extrac[i], long+1)
			}
		}
		
	}
	
	
}


function extract_stem(wrd, nmr ,i,j,min, chr)
{
    min = length(wrd[1])
    for (i=2; i<=nmr; i++)
    {
        if (length(wrd[i]) < min)
        {
            min = length(wrd[i]);
        }
    }

    for (i=1; i <= min; i++)
    {
        chr = substr(wrd[1], i, 1)
        for (j=2; j <= nmr; j++)
        {
            if (substr(wrd[j], i, 1) != chr)
            {
                return i-1;
            }
        }
    }
    return min
}
