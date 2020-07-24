BEGIN {
    FS=" "
}

{
    if (match($0, /^#/) != 0) 
    {
     indentation=$1
     gsub(/#/, "  ", indentation)
               
     title=$0
     sub(/#* /, "", title)
     sub(/ $/, "", title)
     
     link=title
     gsub(/ /, "-", link)
     gsub(/[\(\]\{\}\),\/\\\.+\"`]/, "", link)
     print indentation "* [" title "](#" link ")"
    }
}

END {
}
