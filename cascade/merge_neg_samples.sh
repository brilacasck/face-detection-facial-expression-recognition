cat ./bg/*.lst | awk '{ if ( $0 != "") { printf "./neg/"$0"\n"; fi } }' >> ./bg.txt
