if [ -d git ]; then
    echo "Git already created"
    exit
fi

mkdir git
cd git || exit