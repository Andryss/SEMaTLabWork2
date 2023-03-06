if [ -d svn ]; then
    echo "Svn already created"
    exit
fi

mkdir svn
cd svn || exit