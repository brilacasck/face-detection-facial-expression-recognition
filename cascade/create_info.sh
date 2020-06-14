find ./pos -iname "*.jpg" | awk '// {printf $0" 1 0 0 200 200\n"}' | cat > info.dat

