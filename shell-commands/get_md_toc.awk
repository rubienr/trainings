BEGIN {
    FS=" "
}

{
    if ($1 ~ /#/) 
    {
     indentation=$1
     gsub(/#/, "  ", indentation)
               
     title=$0
     sub(/#* /, "", title)
     
     link=title
     gsub(/ /, "-", link)
     gsub(/[\(\]\{\}\),\/\\]/, "", link)
     print indentation "* [" title "](#" link ")"
    }
}

END {
}
