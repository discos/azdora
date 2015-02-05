#!/b$BASEDIR
if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

echo "Copying configuration files"
cp $BASEDIR/files/hosts /etc/hosts
