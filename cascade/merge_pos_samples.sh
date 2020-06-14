cat ./info/*.lst | awk '{ if ( $0 != "") { printf "./pos/"$0"\n"; fi } }' >> ./info.dat
